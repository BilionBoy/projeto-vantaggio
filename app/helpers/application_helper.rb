module ApplicationHelper
  include Pagy::Frontend

 def btn_submit(form)
  text = form.object.new_record? ? '💾 Incluir' : '🔄 Atualizar'
  icon_class = form.object.new_record? ? 'ph-check-fat ms-2' : 'ph-arrow-clockwise ms-2'

  button_tag(type: 'submit', class: 'btn btn-success btn-submit-animal') do
    safe_join([
      content_tag(:span, text, class: 'fw-bold'),
      content_tag(:i, '', class: icon_class)
    ])
  end
 end


  def formatar_boolean_xlsx(value)
    value ? 'Sim' : 'Não'
  end

  def formatar_data(data)
    return nil if data.blank?

    case data
    when Date
      data.strftime('%d/%m/%Y')
    when String
      return nil unless data.match(%r{\A\d{2}/\d{2}/\d{4}\z})

      Date.strptime(data, '%d/%m/%Y').strftime('%d/%m/%Y')
    else
      nil
    end
  end

  def formatar_mes(mes)
    meses = [
      nil, # índice 0 não é utilizado
      'Janeiro',
      'Fevereiro',
      'Março',
      'Abril',
      'Maio',
      'Junho',
      'Julho',
      'Agosto',
      'Setembro',
      'Outubro',
      'Novembro',
      'Dezembro'
    ]
    meses[mes.to_i] || 'Mês inválido'
  end

  def opcoes_meses
    [
      %w[Janeiro 01],
      %w[Fevereiro 02],
      %w[Março 03],
      %w[Abril 04],
      %w[Maio 05],
      %w[Junho 06],
      %w[Julho 07],
      %w[Agosto 08],
      %w[Setembro 09],
      %w[Outubro 10],
      %w[Novembro 11],
      %w[Dezembro 12]
    ]
  end

  def opcoes_anos
    %w[2024 2025 2026 2027 2028]
  end

  def formatar_inteiro(value)
    value.to_i
  end

  def formatar_data_ano(ano)
    return nil if ano.blank?

    ano.to_s if ano.is_a?(Integer) && ano.to_s.length == 4 # Verifica se é um inteiro e tem 4 dígitos
  end
end
