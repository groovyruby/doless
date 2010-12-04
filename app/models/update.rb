class Update < ActiveRecord::Base
  
  scope :ordered, order('created_at DESC')
  
  belongs_to :user
  belongs_to :project
  
  
  validates :body, :presence=>true
  validates :user_id, :presence=>true
  
  attr_accessible :body
  
end
