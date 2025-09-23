require "test_helper"

class GStatusUsuariosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_status_usuario = g_status_usuarios(:one)
  end

  test "should get index" do
    get g_status_usuarios_url
    assert_response :success
  end

  test "should get new" do
    get new_g_status_usuario_url
    assert_response :success
  end

  test "should create g_status_usuario" do
    assert_difference("GStatusUsuario.count") do
      post g_status_usuarios_url, params: { g_status_usuario: { descricao: @g_status_usuario.descricao } }
    end

    assert_redirected_to g_status_usuario_url(GStatusUsuario.last)
  end

  test "should show g_status_usuario" do
    get g_status_usuario_url(@g_status_usuario)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_status_usuario_url(@g_status_usuario)
    assert_response :success
  end

  test "should update g_status_usuario" do
    patch g_status_usuario_url(@g_status_usuario), params: { g_status_usuario: { descricao: @g_status_usuario.descricao } }
    assert_redirected_to g_status_usuario_url(@g_status_usuario)
  end

  test "should destroy g_status_usuario" do
    assert_difference("GStatusUsuario.count", -1) do
      delete g_status_usuario_url(@g_status_usuario)
    end

    assert_redirected_to g_status_usuarios_url
  end
end
