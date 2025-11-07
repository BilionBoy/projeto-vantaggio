require "test_helper"

class CTiposCentrosCustosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @c_tipo_centro_custo = c_tipos_centros_custos(:one)
  end

  test "should get index" do
    get c_tipos_centros_custos_url
    assert_response :success
  end

  test "should get new" do
    get new_c_tipo_centro_custo_url
    assert_response :success
  end

  test "should create c_tipo_centro_custo" do
    assert_difference("CTipoCentroCusto.count") do
      post c_tipos_centros_custos_url, params: { c_tipo_centro_custo: { descricao: @c_tipo_centro_custo.descricao } }
    end

    assert_redirected_to c_tipo_centro_custo_url(CTipoCentroCusto.last)
  end

  test "should show c_tipo_centro_custo" do
    get c_tipo_centro_custo_url(@c_tipo_centro_custo)
    assert_response :success
  end

  test "should get edit" do
    get edit_c_tipo_centro_custo_url(@c_tipo_centro_custo)
    assert_response :success
  end

  test "should update c_tipo_centro_custo" do
    patch c_tipo_centro_custo_url(@c_tipo_centro_custo), params: { c_tipo_centro_custo: { descricao: @c_tipo_centro_custo.descricao } }
    assert_redirected_to c_tipo_centro_custo_url(@c_tipo_centro_custo)
  end

  test "should destroy c_tipo_centro_custo" do
    assert_difference("CTipoCentroCusto.count", -1) do
      delete c_tipo_centro_custo_url(@c_tipo_centro_custo)
    end

    assert_redirected_to c_tipos_centros_custos_url
  end
end
