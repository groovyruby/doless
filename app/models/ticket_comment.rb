class TicketComment < ActiveRecord::Base
  
  belongs_to :ticket
  belongs_to :owner, :class_name => "User", :foreign_key => "user_id"
  belongs_to :project
  belongs_to :responsible_to, :class_name => "User", :foreign_key => "responsible_id_to"
  belongs_to :responsible_from, :class_name => "User", :foreign_key => "responsible_id_from"
  
  # TODO: DRY - DUPLICATION with Ticket
  # validate :inclusion_of_responsible_id, :if=>proc{|v| not v['responsible_id_to'].blank? }
  validates :state_to, :inclusion=>{:in => %w( opened fixed invalid closed )}, :if=>proc{|v| not v['state_to'].blank? }
  validates :priority_to, :inclusion=>{:in=>Ticket::PRIORITIES.values}, :if=>proc{|v| not v['priority_to'].blank? }
  
  attr_accessible :description, :priority_to, :responsible_id_to, :status_to
  
  before_save :fill_in_ticket_values
  
  # TODO: DRY!
  # def inclusion_of_responsible_id
  #   unless Project::assigned_users_for_validation(self.project_id).member? self.responsible_id_to
  #     errors.add(:responsible_id_to, I18n.t('doless.tickets.errors.responsible_invalid'))
  #   end
  # end
  
  def fill_in_ticket_values
    if not self.priority_to.blank? and self.priority_to != self.ticket.priority
      self.priority_from = self.ticket.priority
      self.ticket.priority = self.priority_to
    else
      self.priority_to = nil
    end
    if self.responsible_id_to != self.ticket.responsible_id
      self.responsible_id_from = self.ticket.responsible_id
      self.ticket.responsible_id = self.responsible_id_to
    else
      self.responsible_id_to = nil
    end
    if not self.status_to.blank? and self.status_to != self.ticket.status
      self.status_from = self.ticket.status
      self.ticket.status = self.status_to
    else
      self.status_to = nil
    end
    self.ticket.save
  end
  
end
