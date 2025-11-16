require "application_system_test_case"

class GEnderecosTest < ApplicationSystemTestCase
  setup do
    @g_endereco = g_enderecos(:one)
  end

  test "visiting the index" do
    visit g_enderecos_url
    assert_selector "h1", text: "G enderecos"
  end

  test "should create g endereco" do
    visit g_enderecos_url
    click_on "New g endereco"

    fill_in "Bairro", with: @g_endereco.bairro
    fill_in "Cep", with: @g_endereco.cep
    fill_in "G municipio", with: @g_endereco.g_municipio_id
    fill_in "Numero", with: @g_endereco.numero
    fill_in "Rua", with: @g_endereco.rua
    click_on "Create G endereco"

    assert_text "G endereco was successfully created"
    click_on "Back"
  end

  test "should update G endereco" do
    visit g_endereco_url(@g_endereco)
    click_on "Edit this g endereco", match: :first

    fill_in "Bairro", with: @g_endereco.bairro
    fill_in "Cep", with: @g_endereco.cep
    fill_in "G municipio", with: @g_endereco.g_municipio_id
    fill_in "Numero", with: @g_endereco.numero
    fill_in "Rua", with: @g_endereco.rua
    click_on "Update G endereco"

    assert_text "G endereco was successfully updated"
    click_on "Back"
  end

  test "should destroy G endereco" do
    visit g_endereco_url(@g_endereco)
    click_on "Destroy this g endereco", match: :first

    assert_text "G endereco was successfully destroyed"
  end
end
