require "application_system_test_case"

class OPropostaTest < ApplicationSystemTestCase
  setup do
    @o_proposta = o_propostas(:one)
  end

  test "visiting the index" do
    visit o_propostas_url
    assert_selector "h1", text: "O proposta"
  end

  test "should create o proposta" do
    visit o_propostas_url
    click_on "New o proposta"

    fill_in "A empresa prestador", with: @o_proposta.a_empresa_prestador_id
    fill_in "Created by", with: @o_proposta.created_by
    fill_in "Deleted at", with: @o_proposta.deleted_at
    fill_in "O solicitacao", with: @o_proposta.o_solicitacao_id
    fill_in "O status", with: @o_proposta.o_status_id
    fill_in "Observacao", with: @o_proposta.observacao
    fill_in "Prazo execucao dias", with: @o_proposta.prazo_execucao_dias
    fill_in "Updated by", with: @o_proposta.updated_by
    fill_in "Usuario envio", with: @o_proposta.usuario_envio_id
    fill_in "Validade proposta", with: @o_proposta.validade_proposta
    fill_in "Valor total", with: @o_proposta.valor_total
    click_on "Create O proposta"

    assert_text "O proposta was successfully created"
    click_on "Back"
  end

  test "should update O proposta" do
    visit o_proposta_url(@o_proposta)
    click_on "Edit this o proposta", match: :first

    fill_in "A empresa prestador", with: @o_proposta.a_empresa_prestador_id
    fill_in "Created by", with: @o_proposta.created_by
    fill_in "Deleted at", with: @o_proposta.deleted_at.to_s
    fill_in "O solicitacao", with: @o_proposta.o_solicitacao_id
    fill_in "O status", with: @o_proposta.o_status_id
    fill_in "Observacao", with: @o_proposta.observacao
    fill_in "Prazo execucao dias", with: @o_proposta.prazo_execucao_dias
    fill_in "Updated by", with: @o_proposta.updated_by
    fill_in "Usuario envio", with: @o_proposta.usuario_envio_id
    fill_in "Validade proposta", with: @o_proposta.validade_proposta.to_s
    fill_in "Valor total", with: @o_proposta.valor_total
    click_on "Update O proposta"

    assert_text "O proposta was successfully updated"
    click_on "Back"
  end

  test "should destroy O proposta" do
    visit o_proposta_url(@o_proposta)
    click_on "Destroy this o proposta", match: :first

    assert_text "O proposta was successfully destroyed"
  end
end
