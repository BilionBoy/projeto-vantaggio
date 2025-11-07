Rails.application.routes.draw do
  resources :a_empresas_prestadores
  resources :a_status
  # --- Módulos gerais ---
  resources :a_tipo_usuarios
  resources :g_localidades
  resources :g_distritos
  resources :g_bairros
  resources :g_municipios
  resources :g_estados
  resources :g_paises

  # --- Devise ---
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations'
  }

  # --- CRUD administrativo de usuários (painel) ---
  resources :users, path: "usuarios"

  # --- Sistema e utilitários ---
  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'home#index'
end
