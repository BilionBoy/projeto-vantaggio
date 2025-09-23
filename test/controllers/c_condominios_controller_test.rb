require "test_helper"

class CCondominiosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @c_condominio = c_condominios(:one)
  end

  test "should get index" do
    get c_condominios_url
    assert_response :success
  end

  test "should get new" do
    get new_c_condominio_url
    assert_response :success
  end

  test "should create c_condominio" do
    assert_difference("CCondominio.count") do
      post c_condominios_url, params: { c_condominio: { endereco: @c_condominio.endereco, nome: @c_condominio.nome, unidade: @c_condominio.unidade } }
    end

    assert_redirected_to c_condominio_url(CCondominio.last)
  end

  test "should show c_condominio" do
    get c_condominio_url(@c_condominio)
    assert_response :success
  end

  test "should get edit" do
    get edit_c_condominio_url(@c_condominio)
    assert_response :success
  end

  test "should update c_condominio" do
    patch c_condominio_url(@c_condominio), params: { c_condominio: { endereco: @c_condominio.endereco, nome: @c_condominio.nome, unidade: @c_condominio.unidade } }
    assert_redirected_to c_condominio_url(@c_condominio)
  end

  test "should destroy c_condominio" do
    assert_difference("CCondominio.count", -1) do
      delete c_condominio_url(@c_condominio)
    end

    assert_redirected_to c_condominios_url
  end
end
