Rails.application.routes.draw do |map|
  resources :forums, :controller => 'community/forums' do
    resources :topics, :controller => 'community/topics', :except => :index do
      resources :posts, :controller => 'community/posts', :except => [:index, :show]
    end
  end
end