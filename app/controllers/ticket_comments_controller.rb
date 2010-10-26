class TicketCommentsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_project
  before_filter :find_ticket
  
  def index
    redirect_to project_ticket_url(@project, @ticket)
  end
  

  # POST /ticket_comments
  # POST /ticket_comments.xml
  def create
    @ticket_comment = @ticket.ticket_comments.new(params[:ticket_comment])
    @ticket_comment.project = @project
    @ticket_comment.owner = current_user
    
    respond_to do |format|
      if @ticket_comment.save
        format.html { redirect_to(project_ticket_url(@project, @ticket), :notice => 'Ticket comment was successfully created.') }
        format.xml  { render :xml => @ticket_comment, :status => :created, :location => @ticket_comment }
      else
        format.html { render :template => "/tickets/show" }
        format.xml  { render :xml => @ticket_comment.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /ticket_comments/1
  # DELETE /ticket_comments/1.xml
  def destroy
    @ticket_comment = @ticket.ticket_comments.find(params[:id])
    @ticket_comment.destroy

    respond_to do |format|
      format.html { redirect_to(project_ticket_url(@project, @ticket)) }
      format.xml  { head :ok }
    end
  end
  
  private
    def find_ticket
      @ticket = @project.tickets.find_by_scoped_id!(params[:ticket_id])
    end
end
