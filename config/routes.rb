Rails.application.routes.draw do
  get 'comments/index'
  get 'posts/index'
  root :to => 'questions#index'


  resources :questions do
      resources :answers
  end

  resources :posts do
    resources :comments
  end

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
