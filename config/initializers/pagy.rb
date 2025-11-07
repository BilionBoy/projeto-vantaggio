require 'pagy'
require 'pagy/extras/bootstrap'

Pagy::I18n.load(locale: 'pt-BR')
Pagy::DEFAULT[:items] = 6
