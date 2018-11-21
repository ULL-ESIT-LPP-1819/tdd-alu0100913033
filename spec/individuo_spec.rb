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

    @Jose = Persona::Persona.new("José", 22, 1, 1, @node)
    @Datos = Persona::DatosAntropometricos.new("José", 90, 1.65, 22, 1, 90.0, 95.0, 1, @node)


  end

  context "# Inicio de las pruebas sobre el Individuo" do
    it " * Creación de una Persona" do
      # José tiene 22 años, y es un hombre que está en tratamiento
      expect(@Jose).to be_an_instance_of(Persona::Persona)
    end
    it " * Datos Antropométricos bien instanciados" do
      expect(@Datos).to be_an_instance_of(Persona::DatosAntropometricos)
    end
    it " * La persona está en tratamiento para la obesidad" do
      expect(@Datos.tratamiento).to eq(1)
      expect(@Datos.imc).to match(/Obesidad/)
    end

  end # Fin de las pruebas sobre el Individuo

  context "# Comprobar clase, tipo y jerarquía" do
    it "* Persona y DatosAntropometricos son clases dentro de un módulo" do
      expect(@Jose).to be_a_kind_of(Persona::Persona)
      expect(@Datos).to be_a_kind_of(Persona::DatosAntropometricos)
      expect(Persona.class).to be(Module)
      expect(Persona::Persona.class).to be(Class)
      expect(Persona::DatosAntropometricos.class).to be(Class)
    end
    it "* Jerarquía de clases correcta" do
      expect(Persona::DatosAntropometricos.ancestors).to eq([Persona::DatosAntropometricos, Persona::Persona, Etiqueta::Node, Struct, Enumerable, Object, Kernel, BasicObject]
)
    end
  end # Comprobar clase, tipo y jerarquía


end # RSpec.describe Individuo