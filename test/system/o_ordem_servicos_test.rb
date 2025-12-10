require "application_system_test_case"

class OOrdemServicosTest < ApplicationSystemTestCase
  setup do
    @o_ordem_servico = o_ordem_servicos(:one)
  end

  test "visiting the index" do
    visit o_ordem_servicos_url
    assert_selector "h1", text: "O ordem servicos"
  end

  test "should create o ordem servico" do
    visit o_ordem_servicos_url
    click_on "New o ordem servico"

    fill_in "A empresa prestador", with: @o_ordem_servico.a_empresa_prestador_id
    fill_in "C condominio", with: @o_ordem_servico.c_condominio_id
    fill_in "Data fim", with: @o_ordem_servico.data_fim
    fill_in "Data inicio", with: @o_ordem_servico.data_inicio
    fill_in "O proposta", with: @o_ordem_servico.o_proposta_id
    fill_in "O status", with: @o_ordem_servico.o_status_id
    fill_in "Prazo execucao dias", with: @o_ordem_servico.prazo_execucao_dias
    fill_in "Valor total", with: @o_ordem_servico.valor_total
    click_on "Create O ordem servico"

    assert_text "O ordem servico was successfully created"
    click_on "Back"
  end

  test "should update O ordem servico" do
    visit o_ordem_servico_url(@o_ordem_servico)
    click_on "Edit this o ordem servico", match: :first

    fill_in "A empresa prestador", with: @o_ordem_servico.a_empresa_prestador_id
    fill_in "C condominio", with: @o_ordem_servico.c_condominio_id
    fill_in "Data fim", with: @o_ordem_servico.data_fim.to_s
    fill_in "Data inicio", with: @o_ordem_servico.data_inicio.to_s
    fill_in "O proposta", with: @o_ordem_servico.o_proposta_id
    fill_in "O status", with: @o_ordem_servico.o_status_id
    fill_in "Prazo execucao dias", with: @o_ordem_servico.prazo_execucao_dias
    fill_in "Valor total", with: @o_ordem_servico.valor_total
    click_on "Update O ordem servico"

    assert_text "O ordem servico was successfully updated"
    click_on "Back"
  end

  test "should destroy O ordem servico" do
    visit o_ordem_servico_url(@o_ordem_servico)
    click_on "Destroy this o ordem servico", match: :first

    assert_text "O ordem servico was successfully destroyed"
  end
end
