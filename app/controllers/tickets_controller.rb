class TicketsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project, :only=>[:index, :show, :new, :create]
  before_filter :find_project_for_management, :only=>[:edit, :update, :destroy]

  # GET /tickets
  # GET /tickets.xml
  def index
    @tickets = @project.tickets.desc.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tickets }
    end
  end

  # GET /tickets/1
  # GET /tickets/1.xml
  def show
    @ticket = @project.tickets.find_by_scoped_id!(params[:id])
    @ticket_comment = @ticket.ticket_comments.new
    @ticket_comment.status_to = @ticket.status
    @ticket_comment.responsible_id_to = @ticket.responsible_id
    @ticket_comment.priority_to = @ticket.priority
    @assets = @project.assets.where(:attachable_type=>[Ticket.to_s, TicketComment.to_s]).where(:attachable_id=>([@ticket.id]|@ticket.ticket_comments.all.map{|tc|tc.id})).order('updated_at desc').all
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/new
  # GET /tickets/new.xml
  def new
    @ticket = Ticket.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ticket }
    end
  end

  # GET /tickets/1/edit
  def edit
    @ticket = @project.tickets.find_by_scoped_id!(params[:id])
  end

  # POST /tickets
  # POST /tickets.xml
  def create
    @ticket = Ticket.new(params[:ticket])
    @ticket.project = @project
    @ticket.owner = current_user
    respond_to do |format|
      if @ticket.save
        TicketMailer.ticket_created(@ticket).deliver  
        format.html { redirect_to([@project, @ticket], :notice => 'Ticket was successfully created.') }
        format.xml  { render :xml => @ticket, :status => :created, :location => @ticket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /tickets/1
  # PUT /tickets/1.xml
  def update
    @ticket = @project.tickets.find_by_scoped_id!(params[:id])

    respond_to do |format|
      if @ticket.update_attributes(params[:ticket])
        format.html { redirect_to([@project, @ticket], :notice => 'Ticket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ticket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tickets/1
  # DELETE /tickets/1.xml
  def destroy
    @ticket = @project.tickets.find_by_scoped_id!(params[:id])
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to(project_tickets_url(@project)) }
      format.xml  { head :ok }
    end
  end


end

