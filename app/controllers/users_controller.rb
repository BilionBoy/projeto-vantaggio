# frozen_string_literal: true

class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_user, only: %i[edit update destroy]

  def index
    @q = User.ransack(params[:q])
    @pagy, @users = pagy(@q.result)
  end

  def new
    @user = User.new
    @tipos_usuarios = ATipoUsuario.all
  end

  def create
    @user = User.new(user_params)
    @user.password = SecureRandom.hex(8) if @user.password.blank? # gera senha padrão
    if @user.save
      redirect_to users_path, notice: 'Usuário criado com sucesso!'
    else
      @tipos_usuarios = ATipoUsuario.all
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @tipos_usuarios = ATipoUsuario.all
  end

  def update
    if params[:user][:password].blank?
      params[:user].delete(:password)
      params[:user].delete(:password_confirmation)
    end

    if @user.update(user_params)
      redirect_to users_path, notice: 'Usuário atualizado com sucesso!'
    else
      render :edit
    end
  end

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'Usuário removido com sucesso!'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:nome, :email, :telefone, :password, :password_confirmation, :a_tipo_usuario_id)
  end
end
