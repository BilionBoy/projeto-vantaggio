require "application_system_test_case"

class AEmpresaPrestadorsTest < ApplicationSystemTestCase
  setup do
    @a_empresa_prestador = a_empresas_prestadores(:one)
  end

  test "visiting the index" do
    visit a_empresas_prestadores_url
    assert_selector "h1", text: "A empresa prestadors"
  end

  test "should create a empresa prestador" do
    visit a_empresas_prestadores_url
    click_on "New a empresa prestador"

    fill_in "A status", with: @a_empresa_prestador.a_status_id
    fill_in "Cnpj", with: @a_empresa_prestador.cnpj
    fill_in "Contato", with: @a_empresa_prestador.contato
    fill_in "Created by", with: @a_empresa_prestador.created_by
    fill_in "Deleted at", with: @a_empresa_prestador.deleted_at
    fill_in "Email", with: @a_empresa_prestador.email
    fill_in "Endereco", with: @a_empresa_prestador.endereco
    fill_in "G municipio", with: @a_empresa_prestador.g_municipio_id
    fill_in "Nome fantasia", with: @a_empresa_prestador.nome_fantasia
    fill_in "Razao social", with: @a_empresa_prestador.razao_social
    fill_in "Telefone", with: @a_empresa_prestador.telefone
    fill_in "Updated by", with: @a_empresa_prestador.updated_by
    click_on "Create A empresa prestador"

    assert_text "A empresa prestador was successfully created"
    click_on "Back"
  end

  test "should update A empresa prestador" do
    visit a_empresa_prestador_url(@a_empresa_prestador)
    click_on "Edit this a empresa prestador", match: :first

    fill_in "A status", with: @a_empresa_prestador.a_status_id
    fill_in "Cnpj", with: @a_empresa_prestador.cnpj
    fill_in "Contato", with: @a_empresa_prestador.contato
    fill_in "Created by", with: @a_empresa_prestador.created_by
    fill_in "Deleted at", with: @a_empresa_prestador.deleted_at.to_s
    fill_in "Email", with: @a_empresa_prestador.email
    fill_in "Endereco", with: @a_empresa_prestador.endereco
    fill_in "G municipio", with: @a_empresa_prestador.g_municipio_id
    fill_in "Nome fantasia", with: @a_empresa_prestador.nome_fantasia
    fill_in "Razao social", with: @a_empresa_prestador.razao_social
    fill_in "Telefone", with: @a_empresa_prestador.telefone
    fill_in "Updated by", with: @a_empresa_prestador.updated_by
    click_on "Update A empresa prestador"

    assert_text "A empresa prestador was successfully updated"
    click_on "Back"
  end

  test "should destroy A empresa prestador" do
    visit a_empresa_prestador_url(@a_empresa_prestador)
    click_on "Destroy this a empresa prestador", match: :first

    assert_text "A empresa prestador was successfully destroyed"
  end
end
