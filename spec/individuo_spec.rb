require 'spec_helper'
require 'etiqueta/individuo'

RSpec.describe Persona do

  before :each do
    #Creo los alimentos
    @apple = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
    @apple2 = Etiqueta::Etiqueta.new("manzana2", 199.1, 0.71, 0.13, 0.29, 0.22, 2.79, 0.0, 4.05, 72.83, 289.19, 22.81, 20.6, 0.64, 2.5)
    @apple3 = Etiqueta::Etiqueta.new("manzana3", 189.1, 0.69, 0.11, 0.27, 0.20, 2.76, 0.0, 4.02, 72.79, 288.82, 21.99, 20.4, 0.61, 2.2)
    #Creo la lista que los almacena
    @node = Etiqueta::Node.new(@apple, nil, nil)
    #Los introduzco dentro de la lista
    @node.insert_head(@apple2)
    @node.insert_head(@apple3)
    @node.insert_head(@apple)
    @node.insert_tail(@apple3)
  end

  context "# Inicio de las pruebas sobre el Individuo" do
    it " * Creación de una Persona" do
      # José tiene 22 años, y es un hombre que está en tratamiento
      Jose = Persona::Persona.new("José", 22, 1, 1, @node)
    end
    it " * Datos Antropométricos bien instanciados" do
      Datos = Persona::DatosAntropometricos.new("José", 80, 175, 22, 1, 80.0, 85.0, 1, @node)
    end

  end # Fin de las pruebas sobre el Individuo



end # RSpec.describe Individuo
