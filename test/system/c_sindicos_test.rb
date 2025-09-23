require "application_system_test_case"

class CSindicosTest < ApplicationSystemTestCase
  setup do
    @c_sindico = c_sindicos(:one)
  end

  test "visiting the index" do
    visit c_sindicos_url
    assert_selector "h1", text: "C sindicos"
  end

  test "should create c sindico" do
    visit c_sindicos_url
    click_on "New c sindico"

    fill_in "C condominio", with: @c_sindico.c_condominio_id
    fill_in "Cpf", with: @c_sindico.cpf
    fill_in "Email", with: @c_sindico.email
    fill_in "G status usuario", with: @c_sindico.g_status_usuario_id
    fill_in "G tipo usuario", with: @c_sindico.g_tipo_usuario_id
    fill_in "Matricula", with: @c_sindico.matricula
    fill_in "Nome", with: @c_sindico.nome
    fill_in "Telefone", with: @c_sindico.telefone
    click_on "Create C sindico"

    assert_text "C sindico was successfully created"
    click_on "Back"
  end

  test "should update C sindico" do
    visit c_sindico_url(@c_sindico)
    click_on "Edit this c sindico", match: :first

    fill_in "C condominio", with: @c_sindico.c_condominio_id
    fill_in "Cpf", with: @c_sindico.cpf
    fill_in "Email", with: @c_sindico.email
    fill_in "G status usuario", with: @c_sindico.g_status_usuario_id
    fill_in "G tipo usuario", with: @c_sindico.g_tipo_usuario_id
    fill_in "Matricula", with: @c_sindico.matricula
    fill_in "Nome", with: @c_sindico.nome
    fill_in "Telefone", with: @c_sindico.telefone
    click_on "Update C sindico"

    assert_text "C sindico was successfully updated"
    click_on "Back"
  end

  test "should destroy C sindico" do
    visit c_sindico_url(@c_sindico)
    click_on "Destroy this c sindico", match: :first

    assert_text "C sindico was successfully destroyed"
  end
end
