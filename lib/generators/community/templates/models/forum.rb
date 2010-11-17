class Forum < ActiveRecord::Base
  
  # Associations
  has_many :forums, :dependent => :destroy, :foreign_key => "category_id"
  has_many :topics, :dependent => :destroy
  has_many :posts, :through => :topics
  
  belongs_to :category, :class_name => "Forum"
  
  # Accessors
  attr_accessible :title, :description, :state, :position, :category_id
  
  # Scopes
  default_scope :order => 'position ASC'
  
  # Validations
  validates :title,       :presence => true
  validates :description, :presence => true
end