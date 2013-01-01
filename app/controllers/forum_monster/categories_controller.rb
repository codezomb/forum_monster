module ForumMonster
  class CategoriesController < ApplicationController
    expose(:categories, :model => :category)

    def create
      if category.save
        redirect_to root_url :notice => "Category was created successfully."
      else
        render :new
      end
    end

    def update
      if category.save
        redirect_to root_url, :notice => "Category was updated successfully."
      else
        render :edit
      end
    end

    def destroy
      category.destroy
      redirect_to root_url, :notice => "Category was deleted successfully."
    end
  end
end
