module ForumMonster
  class Post < ActiveRecord::Base

    # Associations
    belongs_to :topic,  :counter_cache => true
    belongs_to :poster, :polymorphic => true

    # Accessible Attributes
    attr_accessible :body, :initial_post, :approved, :flagged

    # Validations
    validates :body, :presence => true
    validate  :topic_isnt_locked

    # Scopes
    default_scope order('created_at ASC')

    # Callbacks
    after_destroy :destroy_topic

    private

      def topic_isnt_locked
        if ForumMonster::Configuration.global_lock
          if self.topic.locked?
            self.errors.add(:base, "You cannot reply to, or modify a locked topic.")
          end
        end
      end

      def destroy_topic
        self.topic.destroy if self.initial_post?
      end

  end
end
