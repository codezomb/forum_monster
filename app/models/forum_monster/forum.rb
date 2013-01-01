module ForumMonster
  class Forum < ActiveRecord::Base

    # Associations
    belongs_to :category
    has_many :topics, :dependent => :destroy
    has_many :posts, :through => :topics

    # Validations
    validates :title, :presence => true
    validates :description, :presence => true

    # Accessible Attributes
    attr_accessible :description, :enabled, :position, :title, :topics_count

    ###
    # Number of posts in a forum
    ###
    def posts_count
      posts.size
    end

    ###
    # Get the latest topic in the forum
    ###
    def latest_topic
      topics.last
    end

    ###
    # Sort the list of topics
    ###
    def topic_list
      topics.sort_by { |t| [t.stickied ? 0 : 1, - t.last_updated_at.to_i] }
    end

    ###
    # TODO
    # Flagged Posts
    ###
    def flagged_posts
      posts.where(:flagged => true)
    end

    ###
    # TODO
    # Flagged Topics
    ###
    def flagged_topics
      topics.where(:flagged => true)
    end

  end
end