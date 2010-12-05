class Document < ActiveRecord::Base
  
  scope :main, where('is_main=?', true)
  
  belongs_to :project
  belongs_to :user
  belongs_to :changer, :class_name => "User", :foreign_key => "changed_by_id"
  
  
  validates :title, :presence=>true
  validates :user_id, :presence=>true
  validates :changed_by_id, :presence=>true
  
  attr_accessible :title, :content, :changed_by_id
  
  before_save :mark_as_main
  after_save :take_care_of_main_documents
  
  def mark_as_main
    if Document.where('project_id=? and is_main=?', self.project_id, true).all.count == 0
      self.is_main = true
    end
  end
  
  def take_care_of_main_documents
    if self.is_main?
      Document.update_all(['is_main=? ', false], ['id!=? and project_id=?', self.id, self.project_id])
    end
  end
  
end
