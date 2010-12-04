class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :try_to_find_project
  before_filter :generate_new_task, :only=>[:index, :starred, :completed]
  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = context.active.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
      format.json { render :json => @tasks }
      format.js { render 'list' }
    end
  end

  # GET /tasks/1
  # GET /tasks/1.xml
  def show
    @task = context.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @task }
      format.js { render :json=>@task}
    end
  end

  # GET /tasks/new
  # GET /tasks/new.xml
  def new
    @task = context.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @task }
    end
  end

  # GET /tasks/1/edit
  def edit
    @task = context.find(params[:id])
  end

  # POST /tasks
  # POST /tasks.xml
  def create
    @task = context.new(params[:task])
    @task.project = @project
    @task.user = current_user
    respond_to do |format|
      if @task.save
        format.html { redirect_to(redirect, :notice => 'Task was successfully created.') }
        format.xml  { render :xml => @task, :status => :created, :location => @task }
        format.js { render :json=>@task}
        
      else
        format.html { redirect_to(redirect, :notice => 'Please try again.') }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
        format.js { render :json=>@task.errors, :status => :unprocessable_entity}
        
      end
    end
  end

  # PUT /tasks/1
  # PUT /tasks/1.xml
  def update
    @task = context.find(params[:id])

    respond_to do |format|
      if @task.update_attributes(params[:task])
        format.html { redirect_to(redirect, :notice => 'Task was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { redirect_to(redirect, :notice => 'Please try again') }
        format.xml  { render :xml => @task.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.xml
  def destroy
    @task = context.find(params[:id])
    @task.destroy

    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.xml  { head :ok }
    end
  end
  
  def switch_completed
    @task = context.find(params[:id])
    @task.switch_completed!
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.js { render :json=>@task }
    end
  end
  
  def switch_starred
    @task = context.find(params[:id])
    @task.switch_starred!
    respond_to do |format|
      format.html { redirect_to(tasks_url) }
      format.js { render :json=>@task }
    end
  end
  
  def starred
    @tasks = context.active.starred
    respond_to do |format|
      format.html { render :action=>"index" }
      format.json { render :json=>@tasks }
      format.js { render 'list' }
    end
  end
  
  def completed
    @tasks = context.completed
    respond_to do |format|
      format.html { render :action=>"index" }
      format.json { render :json=>@tasks }
      format.js { render 'list' }
    end
  end
  
  private
    
    def context
      @project.blank? ? current_user.tasks : current_user.tasks.where('project_id=?', @project.id)
    end
    
    def redirect
      tasks_url(:project_id=>@project.to_param)
    end
    
    def try_to_find_project
      begin
        find_project
      rescue
        @project = nil
      end
    end
    
    def generate_new_task
      @task = Task.new
    end
end
