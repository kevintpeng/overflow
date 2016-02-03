Rails.application.routes.draw do
  # custom registrations controller for extra strong params
  devise_for :users, :controllers => { registrations: 'users/registrations'}

  root 'topics#index'
  resources :topics do
    resources :questions
  end
  resources :tags
  resources :answers
end
