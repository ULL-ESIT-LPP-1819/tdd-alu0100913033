require 'spec_helper'
require 'etiqueta/individuo'

RSpec.describe Persona do

  context "# Inicio de las pruebas sobre el Individuo" do
    it " * Creación de una Persona" do
      # José tiene 22 años, y es un hombre que está en tratamiento
      Jose = Persona::Persona.new("José", 22, 1, 1)
    end
    it " * Datos Antropométricos bien instanciados" do
      Datos = Persona::DatosAntropometricos.new("José", 80, 175, 22, 1, 80.0, 85.0, 1)
    end

  end # Fin de las pruebas sobre el Individuo



end # RSpec.describe Individuo
