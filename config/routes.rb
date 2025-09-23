Rails.application.routes.draw do
  resources :c_cartoes
  resources :c_nivel_cartoes
  resources :c_tipo_cartoes
  devise_for :users
  
  root 'home#index'
  get 'home/index'
  
  # Rotas Scaffold
  
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get 'up' => 'rails/health#show', as: :rails_health_check
  resources :p_categorias
  resources :g_status_usuarios
  resources :g_tipo_usuarios
  resources :c_condominios
  resources :c_sindicos
  resources :p_prestadores
end
