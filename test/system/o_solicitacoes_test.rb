require "application_system_test_case"

class OSolicitacaosTest < ApplicationSystemTestCase
  setup do
    @o_solicitacao = o_solicitacoes(:one)
  end

  test "visiting the index" do
    visit o_solicitacoes_url
    assert_selector "h1", text: "O solicitacaos"
  end

  test "should create o solicitacao" do
    visit o_solicitacoes_url
    click_on "New o solicitacao"

    fill_in "C centro custo", with: @o_solicitacao.c_centro_custo_id
    fill_in "C condominio", with: @o_solicitacao.c_condominio_id
    fill_in "Data publicacao", with: @o_solicitacao.data_publicacao
    fill_in "Descricao", with: @o_solicitacao.descricao
    fill_in "Email", with: @o_solicitacao.email
    fill_in "Local", with: @o_solicitacao.local
    fill_in "O tipo solicitacao", with: @o_solicitacao.o_tipo_solicitacao_id
    fill_in "O urgencia", with: @o_solicitacao.o_urgencia_id
    fill_in "Responsavel", with: @o_solicitacao.responsavel
    fill_in "Telefone", with: @o_solicitacao.telefone
    click_on "Create O solicitacao"

    assert_text "O solicitacao was successfully created"
    click_on "Back"
  end

  test "should update O solicitacao" do
    visit o_solicitacao_url(@o_solicitacao)
    click_on "Edit this o solicitacao", match: :first

    fill_in "C centro custo", with: @o_solicitacao.c_centro_custo_id
    fill_in "C condominio", with: @o_solicitacao.c_condominio_id
    fill_in "Data publicacao", with: @o_solicitacao.data_publicacao.to_s
    fill_in "Descricao", with: @o_solicitacao.descricao
    fill_in "Email", with: @o_solicitacao.email
    fill_in "Local", with: @o_solicitacao.local
    fill_in "O tipo solicitacao", with: @o_solicitacao.o_tipo_solicitacao_id
    fill_in "O urgencia", with: @o_solicitacao.o_urgencia_id
    fill_in "Responsavel", with: @o_solicitacao.responsavel
    fill_in "Telefone", with: @o_solicitacao.telefone
    click_on "Update O solicitacao"

    assert_text "O solicitacao was successfully updated"
    click_on "Back"
  end

  test "should destroy O solicitacao" do
    visit o_solicitacao_url(@o_solicitacao)
    click_on "Destroy this o solicitacao", match: :first

    assert_text "O solicitacao was successfully destroyed"
  end
end
