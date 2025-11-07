require "test_helper"

class CCartoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @c_cartao = c_cartoes(:one)
  end

  test "should get index" do
    get c_cartoes_url
    assert_response :success
  end

  test "should get new" do
    get new_c_cartao_url
    assert_response :success
  end

  test "should create c_cartao" do
    assert_difference("CCartao.count") do
      post c_cartoes_url, params: { c_cartao: { c_nivel_cartal_id: @c_cartao.c_nivel_cartal_id, c_tipo_cartao_id: @c_cartao.c_tipo_cartao_id, codigo_cartao: @c_cartao.codigo_cartao, qrcode: @c_cartao.qrcode } }
    end

    assert_redirected_to c_cartao_url(CCartao.last)
  end

  test "should show c_cartao" do
    get c_cartao_url(@c_cartao)
    assert_response :success
  end

  test "should get edit" do
    get edit_c_cartao_url(@c_cartao)
    assert_response :success
  end

  test "should update c_cartao" do
    patch c_cartao_url(@c_cartao), params: { c_cartao: { c_nivel_cartal_id: @c_cartao.c_nivel_cartal_id, c_tipo_cartao_id: @c_cartao.c_tipo_cartao_id, codigo_cartao: @c_cartao.codigo_cartao, qrcode: @c_cartao.qrcode } }
    assert_redirected_to c_cartao_url(@c_cartao)
  end

  test "should destroy c_cartao" do
    assert_difference("CCartao.count", -1) do
      delete c_cartao_url(@c_cartao)
    end

    assert_redirected_to c_cartoes_url
  end
end
