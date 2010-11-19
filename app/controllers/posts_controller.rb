class PostsController < ApplicationController
  
  before_filter :authenticate_user!
  before_filter :find_project
  before_filter :find_topic
  
  def index
    redirect_to project_topic_url(@project, @topic)
  end
  

  # POST /posts
  # POST /posts.xml
  def create
    @post = @topic.posts.new(params[:post])
    @post.project = @project
    @post.user = current_user
    
    respond_to do |format|
      if @post.save
        format.html { redirect_to(project_topic_url(@project, @topic), :notice => 'Post was successfully created.') }
        format.xml  { render :xml => @post, :status => :created, :location => @post }
      else
        format.html { render :template => "/topics/show" }
        format.xml  { render :xml => @post.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /posts/1
  # DELETE /posts/1.xml
  def destroy
    @post = @topic.posts.find(params[:id])
    @post.destroy

    respond_to do |format|
      format.html { redirect_to(project_topic_url(@project, @topic)) }
      format.xml  { head :ok }
    end
  end
  
  private
    def find_topic
      @topic = @project.topics.find_by_scoped_id!(params[:topic_id])
    end
end
