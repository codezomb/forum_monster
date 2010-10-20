class Community::Post < ActiveRecord::Base
  
  # Associations
  belongs_to :forum, :counter_cache => true
  belongs_to :topic, :counter_cache => true
  belongs_to :user, :class_name => "<%= "#{singular_camel_case_name}" %>", :counter_cache => true
  
  # Accessors
  attr_accessible :body
  
  # Validations
  validates :body, :presence => true
  
  # Scopes
  default_scope :order => 'created_at ASC'
  
  # Callbacks
  before_save :topic_locked?
  
  # Methods
  private
    def topic_locked?
      if topic.locked?
        errors.add(:base, "That topic is locked")
        false
      end
    end
  
end