require 'sidekiq/web'

Rails.application.routes.draw do
  resources :meetings do
  	 resources :comments
  end
    authenticate :user, lambda { |u| u.admin? } do
      mount Sidekiq::Web => '/sidekiq'
    end


  devise_for :users
  root to: 'home#index'
  get 'active-sessions', to: "meetings#active_sessions"
  get  'roles/:role', to: "users#fetchrole"
  resources :users , only: [:index]
  #mount_ember_app :frontend, to: "/frontend"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

#Rails.application.routes.draw do
#  mount_ember_app :frontend, to: "/"
#end 