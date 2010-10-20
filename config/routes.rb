Rails.application.routes.draw do |map|
  # Forums are a top level resource
  resources :forums, :controller => 'community/forums', :only => [:index, :show] do
    # Only the new and create methods are namespaced so we can dertmine the parent
    resources :topics, :controller => 'community/topics', :only => [:new, :create]
  end
  
  # Topic show, edit, and update actions are top level
  resources :topics, :controller => 'community/topics', :only => [:show, :edit, :update] do
    # All post actions are namespaced so we can determine the parent
    resources :posts, :controller => 'community/posts', :only => [:new, :create, :edit, :update]
  end
end