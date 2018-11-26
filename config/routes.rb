Rails.application.routes.draw do
# <<<<<<< mocchi
#   get 'comments/index'
#   get 'posts/index'
=======
  devise_for :users
# >>>>>>> master
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
