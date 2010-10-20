class Community::Forum < ActiveRecord::Base
  
  # Associations
  has_many :topics, :dependent => :destroy
  has_many :posts, :through => :topics
  
  # Accessors
  attr_accessible :title, :description
  
  # Validations
  validates :title, :presence => true
  validates :description, :presence => true
  
end