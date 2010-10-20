class Community::TopicsController < ApplicationController
  unloadable
  
  def show
    @topic = Topic.find(params[:id])
  end
  
  def new
  end
  
  def create
  end
end