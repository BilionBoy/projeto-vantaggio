require "application_system_test_case"

class CNivelCartaosTest < ApplicationSystemTestCase
  setup do
    @c_nivel_cartao = c_nivel_cartoes(:one)
  end

  test "visiting the index" do
    visit c_nivel_cartoes_url
    assert_selector "h1", text: "C nivel cartaos"
  end

  test "should create c nivel cartao" do
    visit c_nivel_cartoes_url
    click_on "New c nivel cartao"

    fill_in "Descricao", with: @c_nivel_cartao.descricao
    click_on "Create C nivel cartao"

    assert_text "C nivel cartao was successfully created"
    click_on "Back"
  end

  test "should update C nivel cartao" do
    visit c_nivel_cartao_url(@c_nivel_cartao)
    click_on "Edit this c nivel cartao", match: :first

    fill_in "Descricao", with: @c_nivel_cartao.descricao
    click_on "Update C nivel cartao"

    assert_text "C nivel cartao was successfully updated"
    click_on "Back"
  end

  test "should destroy C nivel cartao" do
    visit c_nivel_cartao_url(@c_nivel_cartao)
    click_on "Destroy this c nivel cartao", match: :first

    assert_text "C nivel cartao was successfully destroyed"
  end
end
