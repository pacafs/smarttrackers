Rails.application.routes.draw do
  #mount Motor::Admin => '/admin'
  root "home#index"
  devise_for :users
  
  resources :gauges do
    resources :measurements do
      resource :review, only: [:new, :create]
    end
  end
  
end
