Rails.application.routes.draw do |map|
  resources :forums, :controller => 'community/forums', :only => [:index, :show]
  resources :topics, :controller => 'community/topics', :only => [:show, :new, :create]
end