class TicketMailer < ActionMailer::Base
  default :from => "robot@dolessapp.com"

  def ticket_created(ticket)
    @ticket = ticket
    mail(:to=>ticket.project.users.map{|u| u.email}, :subject=>"New ticket - #{ticket.title}")
  end
end
