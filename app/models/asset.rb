class Asset < ActiveRecord::Base

  belongs_to :attachable, :polymorphic=>true
  belongs_to :project
  belongs_to :user
  

  has_attached_file :asset
  
  after_create :assign_project

  attr_accessible :asset, :_destroy
  
  def assign_project
    if self.attachable.project
      self.project = self.attachable.project
      self.save
    end
  end
  
end

