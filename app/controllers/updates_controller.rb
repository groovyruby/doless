class UpdatesController < ApplicationController
  before_filter :authenticate_user!
  
  # GET /updates
  # GET /updates.xml
  def index
    @updates = Update.all
    @update = Update.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @updates }
    end
  end

  # GET /updates/1
  # GET /updates/1.xml
  def show
    @update = Update.find(params[:id])

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
    respond_to do |format|
      if @update.save
        format.html { redirect_to(updates_url, :notice => 'Update was successfully created.') }
        format.xml  { render :xml => @update, :status => :created, :location => @update }
      else
        format.html { redirect_to(updates_url, :notice => 'Unable to create an update') }
        format.xml  { render :xml => @update.errors, :status => :unprocessable_entity }
      end
    end
  end
  
  # DELETE /updates/1
  # DELETE /updates/1.xml
  def destroy
    @update = Update.find(params[:id])
    @update.destroy

    respond_to do |format|
      format.html { redirect_to(updates_url) }
      format.xml  { head :ok }
    end
  end
end
