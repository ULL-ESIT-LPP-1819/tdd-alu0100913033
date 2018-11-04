require 'spec_helper'
require 'etiqueta'

RSpec.describe Etiqueta do

   #Creación correcta de una clase
  context "# Inicialización de la clase etiqueta" do
    it "Se crea una etiqueta \"manzana\" correctamente" do
      apple = Etiqueta::Etiqueta.new("manzana", 108.16, 0.72, 0.12, 22.80, 20.62, 0.63, 2.40)
    end
  end # context

  # Existencia de los parámetros
  context "# Comprobar parámetros de la clase" do
    before :each  do
      @apple = Etiqueta::Etiqueta.new("manzana", 108.16, 0.72, 0.12, 22.80, 20.62, 0.63, 2.40)
    end

    describe @apple do
      it "Nombre bien especificado" do
        expect(@apple.nombre).to eq("manzana")
      end
      it "Valor energético especificado" do
        expect(@apple.v_energetico).to be >= 0
        expect(@apple.v_energetico).to eq(108.16)
      end
      it "Grasas correctamente indicadas" do
        expect(@apple.grasas).to be >= 0
        expect(@apple.grasas).to eq(0.72)
      end
      it "Grasas saturadas correctamente indicadas" do
        expect(@apple.grasas_sat).to be >= 0
        expect(@apple.grasas_sat).to eq(0.12)
      end
      it "Hidratos de carbono correctamente indicadss" do
        expect(@apple.hidratos).to be >= 0
        expect(@apple.hidratos).to eq(22.8)
      end

    end


  end






end
