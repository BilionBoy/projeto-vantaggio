require "application_system_test_case"

class PPrestadorsTest < ApplicationSystemTestCase
  setup do
    @p_prestador = p_prestadores(:one)
  end

  test "visiting the index" do
    visit p_prestadores_url
    assert_selector "h1", text: "P prestadors"
  end

  test "should create p prestador" do
    visit p_prestadores_url
    click_on "New p prestador"

    fill_in "Cnpj", with: @p_prestador.cnpj
    fill_in "Empresa nome", with: @p_prestador.empresa_nome
    fill_in "G status usuario", with: @p_prestador.g_status_usuario_id
    fill_in "G tipo usuario", with: @p_prestador.g_tipo_usuario_id
    fill_in "P categoria", with: @p_prestador.p_categoria_id
    click_on "Create P prestador"

    assert_text "P prestador was successfully created"
    click_on "Back"
  end

  test "should update P prestador" do
    visit p_prestador_url(@p_prestador)
    click_on "Edit this p prestador", match: :first

    fill_in "Cnpj", with: @p_prestador.cnpj
    fill_in "Empresa nome", with: @p_prestador.empresa_nome
    fill_in "G status usuario", with: @p_prestador.g_status_usuario_id
    fill_in "G tipo usuario", with: @p_prestador.g_tipo_usuario_id
    fill_in "P categoria", with: @p_prestador.p_categoria_id
    click_on "Update P prestador"

    assert_text "P prestador was successfully updated"
    click_on "Back"
  end

  test "should destroy P prestador" do
    visit p_prestador_url(@p_prestador)
    click_on "Destroy this p prestador", match: :first

    assert_text "P prestador was successfully destroyed"
  end
end
