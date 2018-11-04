require 'spec_helper'
require 'etiqueta'

RSpec.describe Etiqueta do
  context "# inicialización de la clase etiqueta"
  it "Valor nutricional de una manzana" do
    #v_energetico, grasas, grasas_sat, hidratos, azucares, proteinas, sal
    apple = Etiqueta::Etiqueta.new(108.16, 0.72, 0.12, 22.80, 20.62, 0.63, 2.40)
  end
end
