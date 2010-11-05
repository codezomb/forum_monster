class Community::ForumsController < ApplicationController
  unloadable
  
  def index
    @categories = Forum.where('category_id IS NULL')
  end
  
  def show
    @forum = Forum.find(params[:id], :conditions => 'category_id IS NOT NULL')
  end
end