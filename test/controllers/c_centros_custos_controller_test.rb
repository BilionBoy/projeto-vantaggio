require "test_helper"

class CCentrosCustosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @c_centro_custo = c_centros_custos(:one)
  end

  test "should get index" do
    get c_centros_custos_url
    assert_response :success
  end

  test "should get new" do
    get new_c_centro_custo_url
    assert_response :success
  end

  test "should create c_centro_custo" do
    assert_difference("CCentroCusto.count") do
      post c_centros_custos_url, params: { c_centro_custo: { c_condominio_id: @c_centro_custo.c_condominio_id, c_tipo_centro_custo_id: @c_centro_custo.c_tipo_centro_custo_id, custo: @c_centro_custo.custo, nome: @c_centro_custo.nome, saldo_atual: @c_centro_custo.saldo_atual, valor_inicial: @c_centro_custo.valor_inicial } }
    end

    assert_redirected_to c_centro_custo_url(CCentroCusto.last)
  end

  test "should show c_centro_custo" do
    get c_centro_custo_url(@c_centro_custo)
    assert_response :success
  end

  test "should get edit" do
    get edit_c_centro_custo_url(@c_centro_custo)
    assert_response :success
  end

  test "should update c_centro_custo" do
    patch c_centro_custo_url(@c_centro_custo), params: { c_centro_custo: { c_condominio_id: @c_centro_custo.c_condominio_id, c_tipo_centro_custo_id: @c_centro_custo.c_tipo_centro_custo_id, custo: @c_centro_custo.custo, nome: @c_centro_custo.nome, saldo_atual: @c_centro_custo.saldo_atual, valor_inicial: @c_centro_custo.valor_inicial } }
    assert_redirected_to c_centro_custo_url(@c_centro_custo)
  end

  test "should destroy c_centro_custo" do
    assert_difference("CCentroCusto.count", -1) do
      delete c_centro_custo_url(@c_centro_custo)
    end

    assert_redirected_to c_centros_custos_url
  end
end
