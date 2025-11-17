Rails.application.routes.draw do
  resources :o_solicitacoes
  resources :o_tipo_solicitacoes
  resources :g_enderecos
  resources :t_taxas
  resources :c_centros_custos
  resources :c_tipos_centros_custos
  
  # --- Módulos gerais ---
  resources :a_tipo_usuarios
  resources :g_municipios
  resources :g_estados
  resources :g_paises
  resources :c_condominios
  resources :c_cartoes
  resources :c_nivel_cartoes
  resources :c_tipo_cartoes
  resources :o_categorias_servicos
  resources :o_urgencias
  resources :a_empresas_prestadores
  resources :a_status

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
