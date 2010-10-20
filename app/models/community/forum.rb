class Community::Forum < ActiveRecord::Base
  has_many :topics, :dependent => :destroy
  has_many :posts
end