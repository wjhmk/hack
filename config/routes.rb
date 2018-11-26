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

  post "/likes/:post_id/create" => "likes#create"
  post "/likes/:post_id/destroy" => "likes#destroy"

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
