require "application_system_test_case"

class GStatusUsuariosTest < ApplicationSystemTestCase
  setup do
    @g_status_usuario = g_status_usuarios(:one)
  end

  test "visiting the index" do
    visit g_status_usuarios_url
    assert_selector "h1", text: "G status usuarios"
  end

  test "should create g status usuario" do
    visit g_status_usuarios_url
    click_on "New g status usuario"

    fill_in "Descricao", with: @g_status_usuario.descricao
    click_on "Create G status usuario"

    assert_text "G status usuario was successfully created"
    click_on "Back"
  end

  test "should update G status usuario" do
    visit g_status_usuario_url(@g_status_usuario)
    click_on "Edit this g status usuario", match: :first

    fill_in "Descricao", with: @g_status_usuario.descricao
    click_on "Update G status usuario"

    assert_text "G status usuario was successfully updated"
    click_on "Back"
  end

  test "should destroy G status usuario" do
    visit g_status_usuario_url(@g_status_usuario)
    click_on "Destroy this g status usuario", match: :first

    assert_text "G status usuario was successfully destroyed"
  end
end
