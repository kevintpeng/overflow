Rails.application.routes.draw do
  # custom registrations controller for extra strong params
  devise_for :users, :controllers => { registrations: 'users/registrations'}

  root 'topics#index'
  # TODO fix nested structure to shallow
  resources :topics do
    resources :questions do
      resources :comments
    end
  end
  resources :tags
  resources :answers do
    resources :comments
  end

end
