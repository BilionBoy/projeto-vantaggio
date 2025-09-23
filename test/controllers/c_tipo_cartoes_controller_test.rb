require "test_helper"

class CTipoCartoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @c_tipo_cartao = c_tipo_cartoes(:one)
  end

  test "should get index" do
    get c_tipo_cartoes_url
    assert_response :success
  end

  test "should get new" do
    get new_c_tipo_cartao_url
    assert_response :success
  end

  test "should create c_tipo_cartao" do
    assert_difference("CTipoCartao.count") do
      post c_tipo_cartoes_url, params: { c_tipo_cartao: { descricao: @c_tipo_cartao.descricao } }
    end

    assert_redirected_to c_tipo_cartao_url(CTipoCartao.last)
  end

  test "should show c_tipo_cartao" do
    get c_tipo_cartao_url(@c_tipo_cartao)
    assert_response :success
  end

  test "should get edit" do
    get edit_c_tipo_cartao_url(@c_tipo_cartao)
    assert_response :success
  end

  test "should update c_tipo_cartao" do
    patch c_tipo_cartao_url(@c_tipo_cartao), params: { c_tipo_cartao: { descricao: @c_tipo_cartao.descricao } }
    assert_redirected_to c_tipo_cartao_url(@c_tipo_cartao)
  end

  test "should destroy c_tipo_cartao" do
    assert_difference("CTipoCartao.count", -1) do
      delete c_tipo_cartao_url(@c_tipo_cartao)
    end

    assert_redirected_to c_tipo_cartoes_url
  end
end
