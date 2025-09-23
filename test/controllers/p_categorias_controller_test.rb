require "test_helper"

class PCategoriasControllerTest < ActionDispatch::IntegrationTest
  setup do
    @p_categoria = p_categorias(:one)
  end

  test "should get index" do
    get p_categorias_url
    assert_response :success
  end

  test "should get new" do
    get new_p_categoria_url
    assert_response :success
  end

  test "should create p_categoria" do
    assert_difference("PCategoria.count") do
      post p_categorias_url, params: { p_categoria: { descricao: @p_categoria.descricao } }
    end

    assert_redirected_to p_categoria_url(PCategoria.last)
  end

  test "should show p_categoria" do
    get p_categoria_url(@p_categoria)
    assert_response :success
  end

  test "should get edit" do
    get edit_p_categoria_url(@p_categoria)
    assert_response :success
  end

  test "should update p_categoria" do
    patch p_categoria_url(@p_categoria), params: { p_categoria: { descricao: @p_categoria.descricao } }
    assert_redirected_to p_categoria_url(@p_categoria)
  end

  test "should destroy p_categoria" do
    assert_difference("PCategoria.count", -1) do
      delete p_categoria_url(@p_categoria)
    end

    assert_redirected_to p_categorias_url
  end
end
