class Post < ActiveRecord::Base
  belongs_to :topic
  belongs_to :project
  belongs_to :user

  has_many :assets, :as=>"attachable"


  validates :body, :presence=>true

  accepts_nested_attributes_for :assets, :allow_destroy => true, :reject_if => proc { |a| a['asset'].blank? }

  attr_accessible :body, :assets_attributes

  before_save :attach_user_to_assets

  def attach_user_to_assets
    self.assets.each do |a|
      a.user_id = self.user_id if a.new_record?
    end
  end

  
end
