require "test_helper"

class CSindicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @c_sindico = c_sindicos(:one)
  end

  test "should get index" do
    get c_sindicos_url
    assert_response :success
  end

  test "should get new" do
    get new_c_sindico_url
    assert_response :success
  end

  test "should create c_sindico" do
    assert_difference("CSindico.count") do
      post c_sindicos_url, params: { c_sindico: { c_condominio_id: @c_sindico.c_condominio_id, cpf: @c_sindico.cpf, email: @c_sindico.email, g_status_usuario_id: @c_sindico.g_status_usuario_id, g_tipo_usuario_id: @c_sindico.g_tipo_usuario_id, matricula: @c_sindico.matricula, nome: @c_sindico.nome, telefone: @c_sindico.telefone } }
    end

    assert_redirected_to c_sindico_url(CSindico.last)
  end

  test "should show c_sindico" do
    get c_sindico_url(@c_sindico)
    assert_response :success
  end

  test "should get edit" do
    get edit_c_sindico_url(@c_sindico)
    assert_response :success
  end

  test "should update c_sindico" do
    patch c_sindico_url(@c_sindico), params: { c_sindico: { c_condominio_id: @c_sindico.c_condominio_id, cpf: @c_sindico.cpf, email: @c_sindico.email, g_status_usuario_id: @c_sindico.g_status_usuario_id, g_tipo_usuario_id: @c_sindico.g_tipo_usuario_id, matricula: @c_sindico.matricula, nome: @c_sindico.nome, telefone: @c_sindico.telefone } }
    assert_redirected_to c_sindico_url(@c_sindico)
  end

  test "should destroy c_sindico" do
    assert_difference("CSindico.count", -1) do
      delete c_sindico_url(@c_sindico)
    end

    assert_redirected_to c_sindicos_url
  end
end
