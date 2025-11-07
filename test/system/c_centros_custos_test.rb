require "application_system_test_case"

class CCentroCustosTest < ApplicationSystemTestCase
  setup do
    @c_centro_custo = c_centros_custos(:one)
  end

  test "visiting the index" do
    visit c_centros_custos_url
    assert_selector "h1", text: "C centro custos"
  end

  test "should create c centro custo" do
    visit c_centros_custos_url
    click_on "New c centro custo"

    fill_in "C condominio", with: @c_centro_custo.c_condominio_id
    fill_in "C tipo centro custo", with: @c_centro_custo.c_tipo_centro_custo_id
    fill_in "Custo", with: @c_centro_custo.custo
    fill_in "Nome", with: @c_centro_custo.nome
    fill_in "Saldo atual", with: @c_centro_custo.saldo_atual
    fill_in "Valor inicial", with: @c_centro_custo.valor_inicial
    click_on "Create C centro custo"

    assert_text "C centro custo was successfully created"
    click_on "Back"
  end

  test "should update C centro custo" do
    visit c_centro_custo_url(@c_centro_custo)
    click_on "Edit this c centro custo", match: :first

    fill_in "C condominio", with: @c_centro_custo.c_condominio_id
    fill_in "C tipo centro custo", with: @c_centro_custo.c_tipo_centro_custo_id
    fill_in "Custo", with: @c_centro_custo.custo
    fill_in "Nome", with: @c_centro_custo.nome
    fill_in "Saldo atual", with: @c_centro_custo.saldo_atual
    fill_in "Valor inicial", with: @c_centro_custo.valor_inicial
    click_on "Update C centro custo"

    assert_text "C centro custo was successfully updated"
    click_on "Back"
  end

  test "should destroy C centro custo" do
    visit c_centro_custo_url(@c_centro_custo)
    click_on "Destroy this c centro custo", match: :first

    assert_text "C centro custo was successfully destroyed"
  end
end
