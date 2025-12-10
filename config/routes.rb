Rails.application.routes.draw do
  resources :o_propostas
  resources :o_status

  resources :c_centros_custos do
    member do
      get :saldo   # ← NECESSÁRIO PARA O AJAX FUNCIONAR
    end
  end

  resources :o_solicitacoes do
    member do
      get :saldo_centro
    end
  end

  #Rotas Scaffold
  resources :a_empresas_prestadores
  resources :a_status
  resources :a_tipo_usuarios
  resources :g_localidades
  resources :g_distritos
  resources :g_bairros
  resources :g_municipios
  resources :g_estados
  resources :g_paises
  resources :c_condominios
  resources :c_cartoes
  resources :c_nivel_cartoes
  resources :c_tipo_cartoes
  resources :c_tipos_centros_custos
  resources :o_tipos_solicitacoes
  resources :o_categorias_servicos
  resources :o_urgencias
  resources :t_taxas

  devise_for :users

  resources :users, path: "usuarios"

  get 'up' => 'rails/health#show', as: :rails_health_check
  root 'home#index'
end
