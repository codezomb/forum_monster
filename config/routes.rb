Rails.application.routes.draw do |map|
  resources :forums, :controller => 'community/forums', :only => [:index, :show] do
    resources :topics, :controller => 'community/topics', :only => [:show, :new, :create, :update] do
      resources :posts, :controller => 'community/posts', :only => [:new, :create, :edit, :update, :destroy]
    end
  end
end