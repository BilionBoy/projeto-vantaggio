require "test_helper"

class OSolicitacoesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @o_solicitacao = o_solicitacoes(:one)
  end

  test "should get index" do
    get o_solicitacoes_url
    assert_response :success
  end

  test "should get new" do
    get new_o_solicitacao_url
    assert_response :success
  end

  test "should create o_solicitacao" do
    assert_difference("OSolicitacao.count") do
      post o_solicitacoes_url, params: { o_solicitacao: { c_centro_custo_id: @o_solicitacao.c_centro_custo_id, c_condominio_id: @o_solicitacao.c_condominio_id, data_publicacao: @o_solicitacao.data_publicacao, descricao: @o_solicitacao.descricao, email: @o_solicitacao.email, local: @o_solicitacao.local, o_tipo_solicitacao_id: @o_solicitacao.o_tipo_solicitacao_id, o_urgencia_id: @o_solicitacao.o_urgencia_id, responsavel: @o_solicitacao.responsavel, telefone: @o_solicitacao.telefone } }
    end

    assert_redirected_to o_solicitacao_url(OSolicitacao.last)
  end

  test "should show o_solicitacao" do
    get o_solicitacao_url(@o_solicitacao)
    assert_response :success
  end

  test "should get edit" do
    get edit_o_solicitacao_url(@o_solicitacao)
    assert_response :success
  end

  test "should update o_solicitacao" do
    patch o_solicitacao_url(@o_solicitacao), params: { o_solicitacao: { c_centro_custo_id: @o_solicitacao.c_centro_custo_id, c_condominio_id: @o_solicitacao.c_condominio_id, data_publicacao: @o_solicitacao.data_publicacao, descricao: @o_solicitacao.descricao, email: @o_solicitacao.email, local: @o_solicitacao.local, o_tipo_solicitacao_id: @o_solicitacao.o_tipo_solicitacao_id, o_urgencia_id: @o_solicitacao.o_urgencia_id, responsavel: @o_solicitacao.responsavel, telefone: @o_solicitacao.telefone } }
    assert_redirected_to o_solicitacao_url(@o_solicitacao)
  end

  test "should destroy o_solicitacao" do
    assert_difference("OSolicitacao.count", -1) do
      delete o_solicitacao_url(@o_solicitacao)
    end

    assert_redirected_to o_solicitacoes_url
  end
end
