require 'pagy'
require 'pagy/extras/bootstrap'

Pagy::I18n.load(locale: 'pt-BR')
Pagy::VARS[:items] = 6