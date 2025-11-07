require "application_system_test_case"

class CCartaosTest < ApplicationSystemTestCase
  setup do
    @c_cartao = c_cartoes(:one)
  end

  test "visiting the index" do
    visit c_cartoes_url
    assert_selector "h1", text: "C cartaos"
  end

  test "should create c cartao" do
    visit c_cartoes_url
    click_on "New c cartao"

    fill_in "C nivel cartal", with: @c_cartao.c_nivel_cartal_id
    fill_in "C tipo cartao", with: @c_cartao.c_tipo_cartao_id
    fill_in "Codigo cartao", with: @c_cartao.codigo_cartao
    fill_in "Qrcode", with: @c_cartao.qrcode
    click_on "Create C cartao"

    assert_text "C cartao was successfully created"
    click_on "Back"
  end

  test "should update C cartao" do
    visit c_cartao_url(@c_cartao)
    click_on "Edit this c cartao", match: :first

    fill_in "C nivel cartal", with: @c_cartao.c_nivel_cartal_id
    fill_in "C tipo cartao", with: @c_cartao.c_tipo_cartao_id
    fill_in "Codigo cartao", with: @c_cartao.codigo_cartao
    fill_in "Qrcode", with: @c_cartao.qrcode
    click_on "Update C cartao"

    assert_text "C cartao was successfully updated"
    click_on "Back"
  end

  test "should destroy C cartao" do
    visit c_cartao_url(@c_cartao)
    click_on "Destroy this c cartao", match: :first

    assert_text "C cartao was successfully destroyed"
  end
end
