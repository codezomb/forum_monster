class Community::Post < ActiveRecord::Base
  belongs_to :forum, :counter_cache => true
  belongs_to :topic, :counter_cache => true
  belongs_to :user, :class_name => "<%= "#{singular_camel_case_name}" %>", :counter_cache => true
end