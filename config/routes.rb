Rails.application.routes.draw do
  root 'static_pages#home'

  devise_for :users, :controllers => { registrations: 'registrations' }

  resources :categories do
    resources :messages, only: [:new, :create, :destroy]
  end

end
