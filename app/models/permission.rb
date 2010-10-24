class Permission < ActiveRecord::Base
  
  PERMISSION_TYPES = {:admin=>1000, :manager=>100, :user=>10, :client=>1}
  
  belongs_to :project
  belongs_to :user
  
  validates :user_id, :presence=>true
  validates :project_id, :presence=>true
  validates :permission_type, :presence=>true, :numericality=>true
  
  attr_accessible :user_id, :permission_type
  
end
