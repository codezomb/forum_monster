class TopicsController < ApplicationController  
 
  def show
    @topic = Topic.find(params[:id])
    @topic.hit! if @topic
  end
  
  def new
    @forum = Forum.find(params[:forum_id])
    @topic = Topic.new
  end
  
  def create
    @forum = Forum.find(params[:forum_id])
    @topic = @forum.topics.build(permitted_params)
    @topic.user = current_user
    
    if @topic.save
      flash[:notice] = "Topic was successfully created."
      redirect_to topic_url(@topic)
    else
      render :action => 'new'
    end
  end
  
  def edit
    @topic = Topic.find(params[:id])
  end
  
  def update
    @topic = Topic.find(params[:id])
    
    if @topic.update_attributes(permitted_params)
      flash[:notice] = "Topic was updated successfully."
      redirect_to topic_url(@topic)
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    
    if @topic.destroy
      flash[:notice] = "Topic was deleted successfully."
      redirect_to forum_url(@topic.forum)
    end
  end

  private

    def permitted_params
      params.require(:topic).permit(:title, :body, :sticky, :locked)
    end

end
