class WorkReport < ActiveRecord::Base

  scope :ordered, order('id DESC')

  belongs_to :user
  belongs_to :project
  
  validates :report, :presence=>true
end
