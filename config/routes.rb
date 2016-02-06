Rails.application.routes.draw do
  # custom registrations controller for extra strong params
  devise_for :users, :controllers => { registrations: 'users/registrations'}

  root 'topics#index'
  # TODO fix nested structure to shallow
  resources :topics do
    resources :comments
  end
  resources :questions do
    resources :comments
  end
  resources :tags
  resources :answers do
    member { post :vote }
    resources :comments
  end

  resources :tags
end
