require "application_system_test_case"

class PCategoriaTest < ApplicationSystemTestCase
  setup do
    @p_categoria = p_categorias(:one)
  end

  test "visiting the index" do
    visit p_categorias_url
    assert_selector "h1", text: "P categoria"
  end

  test "should create p categoria" do
    visit p_categorias_url
    click_on "New p categoria"

    fill_in "Descricao", with: @p_categoria.descricao
    click_on "Create P categoria"

    assert_text "P categoria was successfully created"
    click_on "Back"
  end

  test "should update P categoria" do
    visit p_categoria_url(@p_categoria)
    click_on "Edit this p categoria", match: :first

    fill_in "Descricao", with: @p_categoria.descricao
    click_on "Update P categoria"

    assert_text "P categoria was successfully updated"
    click_on "Back"
  end

  test "should destroy P categoria" do
    visit p_categoria_url(@p_categoria)
    click_on "Destroy this p categoria", match: :first

    assert_text "P categoria was successfully destroyed"
  end
end
