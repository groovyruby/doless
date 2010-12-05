class DocumentsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project
  
  # GET /documents
  # GET /documents.xml
  def index
    @documents = @project.documents.all
    @document = @project.documents.main.first
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @documents }
    end
  end

  # GET /documents/1
  # GET /documents/1.xml
  def show
    @document = @project.documents.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/new
  # GET /documents/new.xml
  def new
    @document = @project.documents.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @document }
    end
  end

  # GET /documents/1/edit
  def edit
    @document = @project.documents.find(params[:id])
  end

  # POST /documents
  # POST /documents.xml
  def create
    @document = @project.documents.new(params[:document])
    @document.user = current_user
    @document.changer = current_user
    respond_to do |format|
      if @document.save
        format.html { redirect_to([@project, @document], :notice => 'Document was successfully created.') }
        format.xml  { render :xml => @document, :status => :created, :location => @document }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /documents/1
  # PUT /documents/1.xml
  def update
    @document = @project.documents.find(params[:id])
    params[:document] ||= {}
    params[:changed_by_id] = current_user_id
    respond_to do |format|
      if @document.update_attributes(params[:document])
        format.html { redirect_to([@project, @document], :notice => 'Document was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @document.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /documents/1
  # DELETE /documents/1.xml
  def destroy
    @document = @project.documents.find(params[:id])
    @document.destroy

    respond_to do |format|
      format.html { redirect_to(project_documents_url(@project)) }
      format.xml  { head :ok }
    end
  end
end
