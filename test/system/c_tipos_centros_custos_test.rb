require "application_system_test_case"

class CTipoCentroCustosTest < ApplicationSystemTestCase
  setup do
    @c_tipo_centro_custo = c_tipos_centros_custos(:one)
  end

  test "visiting the index" do
    visit c_tipos_centros_custos_url
    assert_selector "h1", text: "C tipo centro custos"
  end

  test "should create c tipo centro custo" do
    visit c_tipos_centros_custos_url
    click_on "New c tipo centro custo"

    fill_in "Descricao", with: @c_tipo_centro_custo.descricao
    click_on "Create C tipo centro custo"

    assert_text "C tipo centro custo was successfully created"
    click_on "Back"
  end

  test "should update C tipo centro custo" do
    visit c_tipo_centro_custo_url(@c_tipo_centro_custo)
    click_on "Edit this c tipo centro custo", match: :first

    fill_in "Descricao", with: @c_tipo_centro_custo.descricao
    click_on "Update C tipo centro custo"

    assert_text "C tipo centro custo was successfully updated"
    click_on "Back"
  end

  test "should destroy C tipo centro custo" do
    visit c_tipo_centro_custo_url(@c_tipo_centro_custo)
    click_on "Destroy this c tipo centro custo", match: :first

    assert_text "C tipo centro custo was successfully destroyed"
  end
end
