class Community::TopicsController < ApplicationController
  unloadable
  
  before_filter :find_parents, :only => [:new, :create, :edit, :update]
  before_filter :prepare_topic
  
  def show
    @topic.hit! if @topic
  end
  
  def create
    if @topic.save
      flash[:notice] = "Topic was successfully created."
      redirect_to forum_topic_url(@forum, @topic)
    else
      render :action => 'new'
    end
  end
  
  def update
    if @topic.update_attributes(params[:community_topic])
      flash[:notice] = "Topic was updated successfully."
      redirect_to forum_topic_url(@forum, @topic)
    end
  end
  
  private
    def prepare_topic
      case action_name
        when 'new'
          @topic = Community::Topic.new
        when 'create'
          @topic = @forum.topics.build(params[:community_topic])
          @topic.user = current_user
        else
          @topic = Community::Topic.find(params[:id])
      end
    end
    
    def find_parents
      @forum = Community::Forum.find(params[:forum_id])
    end
end