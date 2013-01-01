module ForumMonster
  class Topic < ActiveRecord::Base

    # Associations
    belongs_to :forum,  :counter_cache => true
    belongs_to :poster, :polymorphic => true
    has_many   :posts

    # Accessible Attributes
    attr_accessible :title, :body

    # Validations
    validates :title, :presence => true
    validates :body,  :presence => true

    # Callbacks
    after_create :update_last_post

    ###
    # Latest Post
    ###
    def latest_post
      posts.last
    end

    ###
    # Increase the hit counter on the topic
    # Only applied to top level topics
    ###
    def hit!
      Topic.increment_counter(:hits, id)
    end

    ###
    # Set the last post, for the topic
    ###
    def update_last_post
      update_attribute(:last_updated_at, Time.now)
    end

  end
end