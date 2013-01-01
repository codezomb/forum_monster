module ForumMonster
  class TopicsController < ApplicationController

    before_filter :find, :except => [:new, :create]
    before_filter :new, :only => [:new, :create]

    def show
      @topic.hit! if @topic
    end

    def create
      @topic.poster = fm_current_user
      if @topic.save
        redirect_to @topic, :notice => "Topic was created successfully."
      else
        render :new
      end
    end

    def edit
      if @topic.locked?
        redirect_to @topic, :error => "You cannot edit a locked topic."
      end
    end

    def update
      if @topic.update_attributes(params[:topic])
        redirect_to @topic, :notice => "Topic was updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @topic.destroy
      redirect_to @topic.forum, :notice => "Topic was deleted successfully."
    end

    def lock
      @topic.update_attribute(:locked, !@topic.locked?)
      redirect_to @topic, :notice => "Topic was updated successfully."
    end

    def sticky
      @topic.update_attribute(:stickied, !@topic.stickied?)
      redirect_to @topic, :notice => "Topic was updated successfully."
    end

    def flag
      @topic.update_attribute(:flagged, !@topic.flagged?)
      redirect_to @topic, :notice => "Topic was updated successfully."
    end

    private

      def find
        @topic = ForumMonster::Topic.find(params[:id])
      end

      def new
        @forum = ForumMonster::Forum.find(params[:forum_id])
        @topic = @forum.topics.new(params[:topic])
      end

  end
end