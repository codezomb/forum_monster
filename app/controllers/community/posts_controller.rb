class Community::PostsController < ApplicationController
  unloadable
  
  before_filter :find_parents, :only => [:create, :update, :destroy]
  before_filter :prepare_posts
  before_filter :build_post, :only => :create
  
  def create
    if @post.save
      flash[:notice] = "Post was successfully created."
      redirect_to forum_topic_url(@forum, @topic)
    else
      render :action => 'new'
    end
    
  end
  
  def update
    if @post.update_attributes(params[:community_post])
      flash[:notice] = "Post was successfully updated."
      redirect_to forum_topic_url(@forum, @topic)
    end
  end
  
  def destroy
    if @post.topic.posts_count > 1
      if @post.destroy
        flash[:notice] = "Post was successfully destroyed."
        redirect_to forum_topic_url(@forum, @topic)
      end
    else
      if @topic.destroy
        flash[:notice] = "Topic was successfully deleted."
        redirect_to forum_url(@forum)
      end
    end
  end
  
  private
    def prepare_posts
      case action_name
        when 'new'
          @post = Post.new
        when 'create'
          @post = @topic.posts.build(params[:community_post])
        else
          @post = Post.find(params[:id])
      end
    end
    
    def find_parents
      @forum = Community::Forum.find(params[:forum_id])
      @topic = Community::Topic.find(params[:topic_id])
    end
    
    def build_post
      if @post = @topic.posts.build(params[:community_post])
        @post.user = current_user
        @post.forum = @forum
      end
    end
end