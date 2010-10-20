class Community::ForumsController < ApplicationController
  unloadable
  
  def index
    @forums = Forum.all
  end
  
  def show
    @forum = Forum.find(params[:id])
  end
end