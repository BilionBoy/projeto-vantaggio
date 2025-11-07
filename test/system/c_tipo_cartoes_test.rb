require "application_system_test_case"

class CTipoCartaosTest < ApplicationSystemTestCase
  setup do
    @c_tipo_cartao = c_tipo_cartoes(:one)
  end

  test "visiting the index" do
    visit c_tipo_cartoes_url
    assert_selector "h1", text: "C tipo cartaos"
  end

  test "should create c tipo cartao" do
    visit c_tipo_cartoes_url
    click_on "New c tipo cartao"

    fill_in "Descricao", with: @c_tipo_cartao.descricao
    click_on "Create C tipo cartao"

    assert_text "C tipo cartao was successfully created"
    click_on "Back"
  end

  test "should update C tipo cartao" do
    visit c_tipo_cartao_url(@c_tipo_cartao)
    click_on "Edit this c tipo cartao", match: :first

    fill_in "Descricao", with: @c_tipo_cartao.descricao
    click_on "Update C tipo cartao"

    assert_text "C tipo cartao was successfully updated"
    click_on "Back"
  end

  test "should destroy C tipo cartao" do
    visit c_tipo_cartao_url(@c_tipo_cartao)
    click_on "Destroy this c tipo cartao", match: :first

    assert_text "C tipo cartao was successfully destroyed"
  end
end
