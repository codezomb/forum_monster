class Forum < ActiveRecord::Base
  
  # Associations
  has_many :topics, :dependent => :destroy
  has_many :posts, :through => :topics
  
  belongs_to :category
  
  # Scopes
  default_scope :order => 'position ASC'
  
  # Validations
  validates :title,       :presence => true
  validates :description, :presence => true
  validates :category_id, :presence => true

end