class Task < ActiveRecord::Base
  belongs_to :project
  belongs_to :user
  
  validates :title, :presence=>true
  attr_accessible :title, :is_starred
  
  
  def to_s
    self.title
  end
end
