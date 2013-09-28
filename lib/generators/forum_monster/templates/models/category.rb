class Category < ActiveRecord::Base
  
  # Associations
  has_many :forums, :dependent => :destroy
  
  # Scopes
  default_scope :order => 'position ASC'
  
  # Validations
  validates :title,       :presence => true

end