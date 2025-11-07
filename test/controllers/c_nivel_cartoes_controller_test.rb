require "test_helper"

class CNivelCartoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @c_nivel_cartao = c_nivel_cartoes(:one)
  end

  test "should get index" do
    get c_nivel_cartoes_url
    assert_response :success
  end

  test "should get new" do
    get new_c_nivel_cartao_url
    assert_response :success
  end

  test "should create c_nivel_cartao" do
    assert_difference("CNivelCartao.count") do
      post c_nivel_cartoes_url, params: { c_nivel_cartao: { descricao: @c_nivel_cartao.descricao } }
    end

    assert_redirected_to c_nivel_cartao_url(CNivelCartao.last)
  end

  test "should show c_nivel_cartao" do
    get c_nivel_cartao_url(@c_nivel_cartao)
    assert_response :success
  end

  test "should get edit" do
    get edit_c_nivel_cartao_url(@c_nivel_cartao)
    assert_response :success
  end

  test "should update c_nivel_cartao" do
    patch c_nivel_cartao_url(@c_nivel_cartao), params: { c_nivel_cartao: { descricao: @c_nivel_cartao.descricao } }
    assert_redirected_to c_nivel_cartao_url(@c_nivel_cartao)
  end

  test "should destroy c_nivel_cartao" do
    assert_difference("CNivelCartao.count", -1) do
      delete c_nivel_cartao_url(@c_nivel_cartao)
    end

    assert_redirected_to c_nivel_cartoes_url
  end
end
