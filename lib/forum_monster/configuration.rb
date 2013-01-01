module ForumMonster
  module Configuration
    class << self

      # User Class
      mattr_accessor :user_class
      self.user_class = "User"

      # Use current_user by default when references the currently logged in user
      # This can be updated in the forum_monster.rb initializer from the main app
      mattr_accessor :current_user
      self.current_user = :current_user

      # Lastest Posts
      # Number of posts returned for latest posts
      # The latest_posts method will return this number of posts
      # mattr_accessor :max_latest_posts
      # self.max_latest_posts = 5

      # Post review (TODO)
      # When a post is submitted, should it be approved before it's shown?
      # If false, then the post will be shown bypassing the review process
      # If true, the post will be submitted, and added to the review table
      # mattr_accessor :review_posts
      # self.review_posts = false

      # Topic Locking (TODO)
      # You can toggle this on/off to enable/disable the default locking strategy
      # Locked topics, by default will not be editable/deletable/modifyable by anyone
      # This includes moderators. If you want to use your own lock checking, just set to false
      # mattr_accessor :global_lock
      # self.global_lock = true

      def config(&block)
        yield self
      end
    end
  end
end