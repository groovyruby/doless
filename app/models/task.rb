class Task < ActiveRecord::Base
  
  scope :active, where('is_completed=?', false)
  scope :completed, where('is_completed=?', true)
  
  belongs_to :project
  belongs_to :user
  
  validates :title, :presence=>true
  attr_accessible :title, :is_starred
  
  
  def to_s
    self.title
  end
  
  def switch_completed
    self.is_completed = !self.is_completed
  end
  
  def switch_completed!
    switch_completed
    save
  end
end
