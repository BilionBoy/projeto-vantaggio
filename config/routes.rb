Rails.application.routes.draw do  
  resources :a_tipo_usuarios
  resources :g_localidades
  resources :g_distritos
  resources :g_bairros
  resources :g_municipios
  resources :g_estados
  resources :g_paises
  root 'home#index'
  get 'home/index'
  devise_for :users

  # Rotas Scaffold
  
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
end
