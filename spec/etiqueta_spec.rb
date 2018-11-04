require 'spec_helper'
require 'etiqueta'

RSpec.describe Etiqueta do

  #Creación correcta de una clase
  context "# Inicialización de la clase etiqueta"
  it "Se crea una etiqueta \"manzana\" correctamente" do
    apple = Etiqueta::Etiqueta.new("manzana", 108.16, 0.72, 0.12, 22.80, 20.62, 0.63, 2.40)
  end

  #





end
