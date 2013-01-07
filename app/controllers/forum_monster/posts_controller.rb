module ForumMonster
  class PostsController < ApplicationController

    before_filter :find, :except => [:new, :create]
    before_filter :new, :only => [:new, :create]
    before_filter :lock_check

    def create
      @post.poster = fm_current_user
      if @post.save
        redirect_to @post.topic, :notice => "Post was created successfully."
      else
        render :new
      end
    end

    def edit
      redirect_to edit_topic_path(@post.topic) if @post.initial_post?
    end

    def update
      @post.update_attributes(params[:post])
      if @post.errors.empty?
        redirect_to @post.topic, :notice => "Post was updated successfully."
      else
        render :edit
      end
    end

    def destroy
      @post.destroy
      redirect_to @post.topic, :notice => "Post was deleted successfully."
    end

    def flag
      @post.update_attribute(:flagged, !@post.flagged?)
      redirect_to @post.topic, :notice => "Post was flagged successfully."
    end

    protected

      def find
        @post = ForumMonster::Post.find(params[:id])
      end

      def new
        @topic = ForumMonster::Topic.find(params[:topic_id])
        @post = ForumMonster::Post.find(params[:id])
      end

      def lock_check
        if @topic and @topic.locked?
          redirect_to @topic, :error => "You cannot edit a locked topic."
        end
      end

  end
end
