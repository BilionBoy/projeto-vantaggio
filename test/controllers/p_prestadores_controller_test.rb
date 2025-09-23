require "test_helper"

class PPrestadoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @p_prestador = p_prestadores(:one)
  end

  test "should get index" do
    get p_prestadores_url
    assert_response :success
  end

  test "should get new" do
    get new_p_prestador_url
    assert_response :success
  end

  test "should create p_prestador" do
    assert_difference("PPrestador.count") do
      post p_prestadores_url, params: { p_prestador: { cnpj: @p_prestador.cnpj, empresa_nome: @p_prestador.empresa_nome, g_status_usuario_id: @p_prestador.g_status_usuario_id, g_tipo_usuario_id: @p_prestador.g_tipo_usuario_id, p_categoria_id: @p_prestador.p_categoria_id } }
    end

    assert_redirected_to p_prestador_url(PPrestador.last)
  end

  test "should show p_prestador" do
    get p_prestador_url(@p_prestador)
    assert_response :success
  end

  test "should get edit" do
    get edit_p_prestador_url(@p_prestador)
    assert_response :success
  end

  test "should update p_prestador" do
    patch p_prestador_url(@p_prestador), params: { p_prestador: { cnpj: @p_prestador.cnpj, empresa_nome: @p_prestador.empresa_nome, g_status_usuario_id: @p_prestador.g_status_usuario_id, g_tipo_usuario_id: @p_prestador.g_tipo_usuario_id, p_categoria_id: @p_prestador.p_categoria_id } }
    assert_redirected_to p_prestador_url(@p_prestador)
  end

  test "should destroy p_prestador" do
    assert_difference("PPrestador.count", -1) do
      delete p_prestador_url(@p_prestador)
    end

    assert_redirected_to p_prestadores_url
  end
end
