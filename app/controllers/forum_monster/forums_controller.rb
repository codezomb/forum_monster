module ForumMonster
  class ForumsController < ApplicationController
    expose(:category, :model => Category)
    expose(:forums, :ancestor => :category)
    expose(:forum, :model => Forum)

    def create
      if forum.save
        redirect_to categories_url, :notice => "Forum was created successfully."
      else
        render :new
      end
    end

    def update
      if forum.save
        redirect_to forum, :notice => "Forum was updated successfully."
      else
        render :edit
      end
    end

    def destroy
      forum.destroy
      redirect_to categories_url, :notice => "Forum was deleted successfully."
    end

  end
end