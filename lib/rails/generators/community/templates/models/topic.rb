class Community::Topic < ActiveRecord::Base
  has_many :posts, :dependent => :destroy
  belongs_to :forum, :counter_cache => true
  belongs_to :user, :class_name => "<%= "#{singular_camel_case_name}" %>", :counter_cache => true
end