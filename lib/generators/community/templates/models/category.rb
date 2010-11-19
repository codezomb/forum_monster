class Category < ActiveRecord::Base
  
  # Associations
  has_many :forums, :dependent => :destroy
  
  # Accessors
  attr_accessible :title, :state, :position, :category_id
  
  # Scopes
  default_scope :order => 'position ASC'
  
  # Validations
  validates :title,       :presence => true
end