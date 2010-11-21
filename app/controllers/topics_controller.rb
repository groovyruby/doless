class TopicsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_project, :only=>[:index, :show, :new, :create]
  before_filter :find_project_for_management, :only=>[:edit, :update, :destroy]
  # GET /topics
  # GET /topics.xml
  def index
    @topics = @project.topics.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.xml
  def show
    @topic = @project.topics.find(params[:id])
    # TODO: fix this
    #return(redirect_to(project_topics_url(@project))) if not @project.leaders.member?(current_user) or not @topic.users.member?(current_user)
    @assets = @project.assets.where(:attachable_type=>[Topic.to_s, Post.to_s]).where(:attachable_id=>([@topic.id]|@topic.posts.all.map{|p|p.id})).order('updated_at desc').all

    @post = @topic.posts.new
    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
    @topic = @project.topics.new
    @topic.posts.build
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/1/edit
  def edit
    @topic = @project.topics.find(params[:id])
  end

  # POST /topics
  # POST /topics.xml
  def create
    @topic = Topic.new(params[:topic])
    @topic.project = @project
    @topic.user = current_user
    @topic.posts.first.user = current_user
    respond_to do |format|
      if @topic.save
        format.html { redirect_to([@project, @topic], :notice => 'Topic was successfully created.') }
        format.xml  { render :xml => @topic, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /topics/1
  # PUT /topics/1.xml
  def update
    @topic = @project.topics.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        format.html { redirect_to([@project, @topic], :notice => 'Topic was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
    @topic = @project.topics.find(params[:id])
    @topic.destroy

    respond_to do |format|
      format.html { redirect_to(project_topics_url(@project)) }
      format.xml  { head :ok }
    end
  end
end
