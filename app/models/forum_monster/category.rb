module ForumMonster
  class Category < ActiveRecord::Base

    # Associations
    has_many :forums

    # Accessible Attributes
    attr_accessible :name

    # Validations
    validates :name, :presence => true

  end
end
