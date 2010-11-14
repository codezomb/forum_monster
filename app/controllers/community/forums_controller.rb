class Community::ForumsController < ApplicationController
  unloadable
  
  def index
    @categories = Forum.where('category_id IS NULL')
  end
  
  def new
    @forum = Forum.new
  end
  
  def create
    @forum = Forum.new(params[:community_forum])
    if @forum.save
      flash[:notice] = "Forum was successfully created."
      redirect_to forums_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @forum = Forum.find(params[:id])
  end
  
  def update
    @forum = Forum.find(params[:id])
    if @forum.update_attributes(params[:community_forum])
      if @forum.category_id.nil?
        flash[:notice] = "Category was updated successfully."
        redirect_to forums_url
      else
        flash[:notice] = "Forum was updated successfully."
        redirect_to forum_url(@forum)
      end
    end
  end
  
  def show
    @forum = Forum.find(params[:id], :conditions => 'category_id IS NOT NULL')
  end
  
  def destroy
    @forum = Forum.find(params[:id])
    if @forum.destroy
      flash[:notice] = "Category was deleted."
      redirect_to forums_url
    end
  end
end