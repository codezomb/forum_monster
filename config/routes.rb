ForumMonster::Engine.routes.draw do

  resources :categories
  resources :forums

  resources :topics do
    member do
      put 'lock'
      put 'sticky'
      put 'flag'
    end
  end

  resources :posts do
    member do
      put 'flag'
    end
  end

  root :to => "categories#index"

end