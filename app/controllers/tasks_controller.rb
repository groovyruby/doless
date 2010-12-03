class TasksController < ApplicationController
  before_filter :authenticate_user!
  before_filter :try_to_find_project
  # GET /tasks
  # GET /tasks.xml
  def index
    @tasks = context.all
    @task = Task.new
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @tasks }
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
  end
  
  private
    
    def context
      @project.blank? ? current_user.tasks : @project.tasks
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
end
