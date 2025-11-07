require "test_helper"

class AEmpresasPrestadoresControllerTest < ActionDispatch::IntegrationTest
  setup do
    @a_empresa_prestador = a_empresas_prestadores(:one)
  end

  test "should get index" do
    get a_empresas_prestadores_url
    assert_response :success
  end

  test "should get new" do
    get new_a_empresa_prestador_url
    assert_response :success
  end

  test "should create a_empresa_prestador" do
    assert_difference("AEmpresaPrestador.count") do
      post a_empresas_prestadores_url, params: { a_empresa_prestador: { a_status_id: @a_empresa_prestador.a_status_id, cnpj: @a_empresa_prestador.cnpj, contato: @a_empresa_prestador.contato, created_by: @a_empresa_prestador.created_by, deleted_at: @a_empresa_prestador.deleted_at, email: @a_empresa_prestador.email, endereco: @a_empresa_prestador.endereco, g_municipio_id: @a_empresa_prestador.g_municipio_id, nome_fantasia: @a_empresa_prestador.nome_fantasia, razao_social: @a_empresa_prestador.razao_social, telefone: @a_empresa_prestador.telefone, updated_by: @a_empresa_prestador.updated_by } }
    end

    assert_redirected_to a_empresa_prestador_url(AEmpresaPrestador.last)
  end

  test "should show a_empresa_prestador" do
    get a_empresa_prestador_url(@a_empresa_prestador)
    assert_response :success
  end

  test "should get edit" do
    get edit_a_empresa_prestador_url(@a_empresa_prestador)
    assert_response :success
  end

  test "should update a_empresa_prestador" do
    patch a_empresa_prestador_url(@a_empresa_prestador), params: { a_empresa_prestador: { a_status_id: @a_empresa_prestador.a_status_id, cnpj: @a_empresa_prestador.cnpj, contato: @a_empresa_prestador.contato, created_by: @a_empresa_prestador.created_by, deleted_at: @a_empresa_prestador.deleted_at, email: @a_empresa_prestador.email, endereco: @a_empresa_prestador.endereco, g_municipio_id: @a_empresa_prestador.g_municipio_id, nome_fantasia: @a_empresa_prestador.nome_fantasia, razao_social: @a_empresa_prestador.razao_social, telefone: @a_empresa_prestador.telefone, updated_by: @a_empresa_prestador.updated_by } }
    assert_redirected_to a_empresa_prestador_url(@a_empresa_prestador)
  end

  test "should destroy a_empresa_prestador" do
    assert_difference("AEmpresaPrestador.count", -1) do
      delete a_empresa_prestador_url(@a_empresa_prestador)
    end

    assert_redirected_to a_empresas_prestadores_url
  end
end
