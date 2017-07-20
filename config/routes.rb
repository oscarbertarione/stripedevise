Rails.application.routes.draw do
  get 'payments/new'

  get 'payments/thanks'

 devise_for :users, controllers: {registrations: "registrations"}
  get 'home/index'

  resources :apuntes
  resources :leccions
  resources :plantillas
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  resources :cursos
  resources :charges

  root 'home#index'


  resources :payments, only: [:new, :create]
  get 'payment-thanks', to: 'payments#thanks', as: 'payment_thanks'

 

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
