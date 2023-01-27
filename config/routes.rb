Rails.application.routes.draw do
  scope "(:locale)", locale: /ru|en/ do
    devise_scope :user do
      get 'registration', to: 'devise/registrations#new', as: :new_user_registration
    end
    devise_for :users

    root "rooms#index"
  end
end
