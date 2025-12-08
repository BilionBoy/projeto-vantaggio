# frozen_string_literal: true

module UpcaseAttributes
  extend ActiveSupport::Concern

  included do
    before_validation :normalize_string_fields
  end

  private

  # Converte automaticamente todos os atributos string/text em UPPERCASE
  def normalize_string_fields
    # Seleciona todas as colunas do tipo string/text
    string_columns = self.class.columns.select do |col|
      col.type.in?([:string, :text])
    end.map(&:name)

    string_columns.each do |attr|
      value = send(attr)
      send("#{attr}=", value.to_s.upcase) if value.present?
    end
  end
end
