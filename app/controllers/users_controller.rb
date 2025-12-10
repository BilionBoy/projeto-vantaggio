# frozen_string_literal: true
class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[ edit update destroy ]
  before_action :load_dependencies, only: %i[new edit create update]

  def index
    @q = User.ransack(params[:q])
    @pagy, @users = pagy(@q.result)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.hex(8) if @user.password.blank?

    apply_conditional_assignments

    if @user.save
      redirect_to users_path, notice: "Usuário criado com sucesso!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    apply_conditional_assignments

    if @user.update(user_params)
      redirect_to users_path, notice: "Usuário atualizado com sucesso!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: "Usuário removido com sucesso!"
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def load_dependencies
    @tipos_usuarios = ATipoUsuario.all
    @condominios = CCondominio.all
    @empresas_prestadores = AEmpresaPrestador.all
  end

  # ============================================================
  # PERMISSÕES
  # ============================================================

  def user_params
    params.require(:user).permit(
      :nome,
      :email,
      :telefone,
      :password,
      :password_confirmation,
      :a_tipo_usuario_id,
      :c_condominio_id,
      :a_empresa_prestador_id
    )
  end

  # ============================================================
  # REGRAS DE NEGÓCIO
  # ============================================================

  def apply_conditional_assignments
    tipo = ATipoUsuario.find_by(id: user_params[:a_tipo_usuario_id])&.descricao&.downcase

    case tipo
    when "síndico", "sindico", "gestor"
      @user.a_empresa_prestador_id = nil
      @user.c_condominio_id = current_user.c_condominio_id

    when "prestador"
      @user.c_condominio_id = nil
      # prestador precisa ter empresa vinculada
    else
      # tipos genéricos
      @user.c_condominio_id ||= current_user.c_condominio_id
    end
  end
end
