Rails.application.routes.draw do
  root :to => 'questions#index'
  resources :questions
  # get 'questions/new'
  # get 'questions/index'
  # get 'questions/show'
  # get 'questions/edit'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
