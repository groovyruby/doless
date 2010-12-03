class Project < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  
  has_many :assets
  has_many :permissions
  has_many :users, :through=>:permissions
  #has_many :managers, :class_name => "user", :foreign_key => "user_id", :throught=>:permissions, :where=>['permissions.permission_type>=?', Permission::PERMISSION_TYPES[:leader]
  has_many :tasks
  has_many :tickets
  has_many :topics
  has_many :work_reports
  validates :name, :presence=>true
  
  accepts_nested_attributes_for :permissions, :allow_destroy=>true, :reject_if=>proc {|p| p['permission_type'] == Permission::PERMISSION_TYPES[:admin] }
  
  attr_accessible :name, :permissions_attributes
  
  def make_admin(user)
    p = self.permissions.new
    p.user = user
    p.permission_type = Permission::PERMISSION_TYPES[:admin]
    p.save
  end
  
  def leaders
    self.users.where('permissions.permission_type>=?', Permission::PERMISSION_TYPES[:leader]).all
  end
  
  def admins
    self.users.where('permissions.permission_type>=?', Permission::PERMISSION_TYPES[:admin]).all
  end
  
end
