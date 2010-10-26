class Ticket < ActiveRecord::Base
  #versioned

  PRIORITIES = {
    :low=>10,
    :normal=>100,
    :high=>1000,
    :critical=>10000
  }

  belongs_to :project
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  belongs_to :responsible, :class_name=>"User", :foreign_key => "responsible_id"

  #has_many :assets, :as=>"attachable"
  has_many :ticket_comments
  
  scope :desc, order('updated_at DESC')

  validates :title, :presence=>true
  validates :description, :presence=>true
  validates :priority, :presence=>true
  validates :project_id, :presence=>true
  validates :user_id, :presence=>true
  # validate :inclusion_of_responsible_id, :if=>proc{|v| not v['responsible_id'].blank? }
  # validates_inclusion_of :state, :in => %w( opened fixed invalid closed )
  validates :status, :inclusion=>{:in=>%w( opened fixed invalid closed )}, :if=>proc{|v| not v['status'].blank? }
  validates :priority, :inclusion=>{:in=>Ticket::PRIORITIES.values}

  # accepts_nested_attributes_for :assets, :allow_destroy => true#, :reject_if => proc { |a| a['asset'].blank? and a['_destroy'].blank? }
  accepts_nested_attributes_for :ticket_comments
  
  #validates_associated :assets
  validates_associated :ticket_comments
  
  attr_accessible :title, :description, :status, :priority, :assets_attributes, :ticket_comments_attributes

  # before_save :attach_user_to_assets
  before_create :set_scoped_id

  def to_param
    "#{self.scoped_id}-#{self.title.parameterize}"
  end
  
  def to_s
    "##{self.scoped_id} #{self.title}"
  end

  def priority_str
    Ticket::PRIORITIES.invert[self.priority]
  end

  # def attach_user_to_assets
  #   self.assets.each do |a|
  #     a.user_id = self.user_id if a.new_record?
  #   end
  # end

  def set_scoped_id
    Ticket.transaction do
      self.scoped_id = (self.project.tickets.select.maximum(:scoped_id) || 0)+1
    end
  end

  def close_ticket
    #self.is_closed = true
  end
  
  # def inclusion_of_responsible_id
  #   unless Project::assigned_users_for_validation(self.project_id).member? self.responsible_id
  #     errors.add(:responsible_id, I18n.t('doless.tickets.errors.responsible_invalid'))
  #   end
  # end
  
  def self.statuses_for_select
    %w( opened fixed invalid closed )
  end

end

