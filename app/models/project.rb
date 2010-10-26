class Project < ActiveRecord::Base
  has_friendly_id :name, :use_slug => true
  
  has_many :permissions
  has_many :users, :through=>:permissions
  has_many :tickets
  
  validates :name, :presence=>true
  
  accepts_nested_attributes_for :permissions, :allow_destroy=>true, :reject_if=>proc {|p| p['permission_type'] == Permission::PERMISSION_TYPES[:admin] }
  
  attr_accessible :name, :permissions_attributes
  
  def make_admin(user)
    p = self.permissions.new
    p.user = user
    p.permission_type = Permission::PERMISSION_TYPES[:admin]
    p.save
  end
  
end
