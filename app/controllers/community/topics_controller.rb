class Community::TopicsController < ApplicationController
  unloadable
  
  def show
    @topic = Topic.find(params[:id])
    if @topic
      @topic.hit!
    end
  end
  
  def new
  end
  
  def create
  end
end