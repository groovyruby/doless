class UpdatesController < ApplicationController
  before_filter :authenticate_user!
  before_filter :try_to_find_project
  # GET /updates
  # GET /updates.xml
  def index
    @updates = context.ordered.all
    @update = Update.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @updates }
    end
  end

  # GET /updates/1
  # GET /updates/1.xml
  def show
    @update = context.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @update }
    end
  end

  # GET /updates/new
  # GET /updates/new.xml
  def new
    @update = Update.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @update }
    end
  end
  
  # POST /updates
  # POST /updates.xml
  def create
    @update = Update.new(params[:update])
    @update.user = current_user
    @update.project = @project
    respond_to do |format|
      if @update.save
        format.html { redirect_to(redirect, :notice => 'Update was successfully created.') }
        format.xml  { render :xml => @update, :status => :created, :location => @update }
      else
        format.html { redirect_to(redirect, :notice => 'Unable to create an update') }
        format.xml  { render :xml => @update.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /updates/1
  # DELETE /updates/1.xml
  def destroy
    @update = current_user.updates.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to(redirect) }
      format.xml  { head :ok }
    end
  end
  
  private
  def context
    @project.blank? ? current_user.updates : current_user.updates.where('project_id=?', @project.id)
  end
  
  def redirect
    updates_url(:project_id=>@project.to_param)
  end
  
  def try_to_find_project
    begin
      find_project
    rescue
      @project = nil
    end
  end
end
