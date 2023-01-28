Rails.application.routes.draw do
  scope '(:locale)', locale: /ru|en/ do
    devise_scope :user do
      get 'registration', to: 'devise/registrations#new', as: :new_user_registration
    end
    devise_for :users

    resources :rooms, only: %i[show create], param: :title
    resources :messages, only: :create
    resources :notifications, only: %i[index destroy]

    root 'rooms#index'
  end
end
