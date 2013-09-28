class CategoriesController < ApplicationController  

  def index
    @categories = Category.all
  end
  
  def new
    @category = Category.new
  end
  
  def create
    @category = Category.new(permitted_params)
    
    if @category.save
      flash[:notice] = "Category was successfully created."
      redirect_to forums_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @category = Category.find(params[:id])
  end
  
  def update
    @category = Category.find(params[:id])
    
    if @category.update_attributes(permitted_params)
      flash[:notice] = "Category was updated successfully."
      redirect_to forums_url
    end
  end
  
  def destroy
    @category = Category.find(params[:id])
    
    if @category.destroy
      flash[:notice] = "Category was deleted."
      redirect_to forums_url
    end
  end

  private

    def permitted_params
      params.require(:category).permit(:title, :state, :position, :category_id)
    end

end