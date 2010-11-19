class Topic < ActiveRecord::Base
  has_friendly_id :title, :use_slug => true
  belongs_to :user
  belongs_to :project

  has_many :assets, :as=>"attachable"
  has_many :posts

  has_and_belongs_to_many :users


  accepts_nested_attributes_for :assets, :allow_destroy => true, :reject_if => proc { |a| a['asset'].blank? }
  accepts_nested_attributes_for :posts

  validates :title, :presence=>true
  validates :user_id, :presence=>true

  validates_associated :assets
  validates_associated :posts

  attr_accessible :title, :assets_attributes, :posts_attributes, :user_ids

  before_save :attach_user_to_assets

  def attach_user_to_assets
    self.assets.each do |a|
      a.user_id = self.user_id if a.new_record?
    end
  end

end
