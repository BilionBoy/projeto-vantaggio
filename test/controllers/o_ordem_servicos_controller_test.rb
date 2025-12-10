require "test_helper"

class OOrdemServicosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_ordem_servico = o_ordem_servicos(:one)
  end

  test "should get index" do
    get o_ordem_servicos_url
    assert_response :success
  end

  test "should get new" do
    get new_o_ordem_servico_url
    assert_response :success
  end

  test "should create o_ordem_servico" do
    assert_difference("OOrdemServico.count") do
      post o_ordem_servicos_url, params: { o_ordem_servico: { a_empresa_prestador_id: @o_ordem_servico.a_empresa_prestador_id, c_condominio_id: @o_ordem_servico.c_condominio_id, data_fim: @o_ordem_servico.data_fim, data_inicio: @o_ordem_servico.data_inicio, o_proposta_id: @o_ordem_servico.o_proposta_id, o_status_id: @o_ordem_servico.o_status_id, prazo_execucao_dias: @o_ordem_servico.prazo_execucao_dias, valor_total: @o_ordem_servico.valor_total } }
    end

    assert_redirected_to o_ordem_servico_url(OOrdemServico.last)
  end

  test "should show o_ordem_servico" do
    get o_ordem_servico_url(@o_ordem_servico)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_ordem_servico_url(@o_ordem_servico)
    assert_response :success
  end

  test "should update o_ordem_servico" do
    patch o_ordem_servico_url(@o_ordem_servico), params: { o_ordem_servico: { a_empresa_prestador_id: @o_ordem_servico.a_empresa_prestador_id, c_condominio_id: @o_ordem_servico.c_condominio_id, data_fim: @o_ordem_servico.data_fim, data_inicio: @o_ordem_servico.data_inicio, o_proposta_id: @o_ordem_servico.o_proposta_id, o_status_id: @o_ordem_servico.o_status_id, prazo_execucao_dias: @o_ordem_servico.prazo_execucao_dias, valor_total: @o_ordem_servico.valor_total } }
    assert_redirected_to o_ordem_servico_url(@o_ordem_servico)
  end

  test "should destroy o_ordem_servico" do
    assert_difference("OOrdemServico.count", -1) do
      delete o_ordem_servico_url(@o_ordem_servico)
    end

    assert_redirected_to o_ordem_servicos_url
  end
end
