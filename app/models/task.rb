class Task < ActiveRecord::Base
  
  scope :active, where('is_completed=?', false).order('is_starred DESC')
  scope :completed, where('is_completed=?', true).order('updated_at DESC')
  scope :starred, where('is_starred=?', true)
  
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
  
  def switch_starred
    self.is_starred = !self.is_starred
  end
  
  def switch_starred!
    switch_starred
    save
  end
end
