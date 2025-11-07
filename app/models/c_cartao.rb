# frozen_string_literal: true

class CCartao < ApplicationRecord
  belongs_to :c_tipo_cartao
  belongs_to :c_nivel_cartao

  before_create :generate_unique_codes

  validates :codigo_cartao, uniqueness: true
  validates :qrcode, uniqueness: true

  private

  def generate_unique_codes
    self.codigo_cartao ||= generate_unique_code(prefix: 'CARD')
    self.qrcode ||= generate_unique_code(prefix: 'QRC')
  end

  def generate_unique_code(prefix:)
    loop do
      code = "#{prefix}-#{SecureRandom.alphanumeric(8).upcase}"
      break code unless CCartao.exists?(["codigo_cartao = ? OR qrcode = ?", code, code])
    end
  end
end
