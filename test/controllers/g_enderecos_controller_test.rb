require "test_helper"

class GEnderecosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @g_endereco = g_enderecos(:one)
  end

  test "should get index" do
    get g_enderecos_url
    assert_response :success
  end

  test "should get new" do
    get new_g_endereco_url
    assert_response :success
  end

  test "should create g_endereco" do
    assert_difference("GEndereco.count") do
      post g_enderecos_url, params: { g_endereco: { bairro: @g_endereco.bairro, cep: @g_endereco.cep, g_municipio_id: @g_endereco.g_municipio_id, numero: @g_endereco.numero, rua: @g_endereco.rua } }
    end

    assert_redirected_to g_endereco_url(GEndereco.last)
  end

  test "should show g_endereco" do
    get g_endereco_url(@g_endereco)
    assert_response :success
  end

  test "should get edit" do
    get edit_g_endereco_url(@g_endereco)
    assert_response :success
  end

  test "should update g_endereco" do
    patch g_endereco_url(@g_endereco), params: { g_endereco: { bairro: @g_endereco.bairro, cep: @g_endereco.cep, g_municipio_id: @g_endereco.g_municipio_id, numero: @g_endereco.numero, rua: @g_endereco.rua } }
    assert_redirected_to g_endereco_url(@g_endereco)
  end

  test "should destroy g_endereco" do
    assert_difference("GEndereco.count", -1) do
      delete g_endereco_url(@g_endereco)
    end

    assert_redirected_to g_enderecos_url
  end
end
