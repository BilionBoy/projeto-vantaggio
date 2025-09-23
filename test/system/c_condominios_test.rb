require "application_system_test_case"

class CCondominiosTest < ApplicationSystemTestCase
  setup do
    @c_condominio = c_condominios(:one)
  end

  test "visiting the index" do
    visit c_condominios_url
    assert_selector "h1", text: "C condominios"
  end

  test "should create c condominio" do
    visit c_condominios_url
    click_on "New c condominio"

    fill_in "Endereco", with: @c_condominio.endereco
    fill_in "Nome", with: @c_condominio.nome
    fill_in "Unidade", with: @c_condominio.unidade
    click_on "Create C condominio"

    assert_text "C condominio was successfully created"
    click_on "Back"
  end

  test "should update C condominio" do
    visit c_condominio_url(@c_condominio)
    click_on "Edit this c condominio", match: :first

    fill_in "Endereco", with: @c_condominio.endereco
    fill_in "Nome", with: @c_condominio.nome
    fill_in "Unidade", with: @c_condominio.unidade
    click_on "Update C condominio"

    assert_text "C condominio was successfully updated"
    click_on "Back"
  end

  test "should destroy C condominio" do
    visit c_condominio_url(@c_condominio)
    click_on "Destroy this c condominio", match: :first

    assert_text "C condominio was successfully destroyed"
  end
end
