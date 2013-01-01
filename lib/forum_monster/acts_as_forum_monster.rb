module ForumMonster
  module ActsAsForumMonster
    extend ActiveSupport::Concern

    module ClassMethods
      def acts_as_forum_monster options = {}
        has_many :topics, :class_name => ForumMonster::Topic, :as => :poster, :dependent => :destroy
        has_many :posts,  :class_name => ForumMonster::Post,  :as => :poster, :dependent => :destroy

        ###
        # Allow specification of username field to use
        # This is usually username
        ###
        cattr_accessor :username_attr
        self.username_attr = options[:username_attr] || :username

        ###
        # Support for avatars, default will be gravatars
        ###
        cattr_accessor :avatar_attr
        self.avatar_attr = options[:avatar_attr] || :gravatar_url
        if self.avatar_attr == :gravatar_url
          include Gravtastic
          has_gravatar :file_type => :png, :size => 165
        end

      end
    end

    ###
    # Avatar
    ###
    def fm_avatar
      send(avatar_attr) unless avatar_attr.nil?
    end

    ###
    # Username
    ###
    def fm_username
      send(username_attr)
    end

    ###
    # Post Count
    ###
    def fm_post_count
      (self.posts + self.topics).size
    end

  end
end

ActiveRecord::Base.send :include, ForumMonster::ActsAsForumMonster