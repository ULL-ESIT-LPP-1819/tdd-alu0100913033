require 'spec_helper'
require 'etiqueta'

RSpec.describe Etiqueta do

   #Creación correcta de una clase
  context "# Inicialización de la clase etiqueta" do
    it "Se crea una etiqueta \"manzana\" correctamente" do
      apple = Etiqueta::Etiqueta.new("manzana", 108.16, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
    end
  end # context

  # Existencia de los parámetros
  context "# Comprobar parámetros de la clase" do
    before :each  do
      @apple = Etiqueta::Etiqueta.new("manzana", 108.16, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
    end


    describe @apple do
      it "Nombre bien especificado" do
        expect(@apple.nombre).to eq("manzana")
      end
      it "Valor energético especificado" do
        expect(@apple.v_energetico).not_to be_nil
        expect(@apple.v_energetico).to be >= 0
        expect(@apple.v_energetico).to eq(108.16)
      end
      it "Grasas correctamente indicadas" do
        expect(@apple.grasas).not_to be_nil
        expect(@apple.grasas).to be >= 0
        expect(@apple.grasas).to eq(0.72)
      end
      it "Grasas saturadas correctamente indicadas" do
        expect(@apple.grasas_sat).not_to be_nil
        expect(@apple.grasas_sat).to be >= 0
        expect(@apple.grasas_sat).to eq(0.12)
      end
      it "Grasas monoinsaturadas correctamente indicadas" do
        expect(@apple.grasas_mono).not_to be_nil
        expect(@apple.grasas_mono).to be >= 0
        expect(@apple.grasas_mono).to eq(0.30)
      end
      it "Grasas poliinsaturadas correctamente indicadas" do
        expect(@apple.grasas_poli).not_to be_nil
        expect(@apple.grasas_poli).to be >= 0
        expect(@apple.grasas_poli).to eq(0.21)
      end
      it "polialcoholes correctamente indicados" do
        expect(@apple.polialcoholes).not_to be_nil
        expect(@apple.polialcoholes).to be >= 0
        expect(@apple.polialcoholes).to eq(2.78)
      end
      it "Almidón correctamente indicado" do
        expect(@apple.almidon).not_to be_nil
        expect(@apple.almidon).to be >= 0
        expect(@apple.almidon).to eq(0)
      end
      it "Fibra correctamente indicada" do
        expect(@apple.fibra).not_to be_nil
        expect(@apple.fibra).to be >= 0
        expect(@apple.fibra).to eq(4.04)
      end
      it "Vitaminas correctamente indicadas" do
        expect(@apple.vitaminas).not_to be_nil
        expect(@apple.vitaminas).to be >= 0
        expect(@apple.vitaminas).to eq(72.82)
      end
      it "Minerales correctamente indicados" do
        expect(@apple.minerales).not_to be_nil
        expect(@apple.minerales).to be >= 0
        expect(@apple.minerales).to eq(289.18)
      end
      it "Hidratos de carbono correctamente indicados" do
        expect(@apple.hidratos).not_to be_nil
        expect(@apple.hidratos).to be >= 0
        expect(@apple.hidratos).to eq(22.8)
      end
      it "Azúcares correctamente indicados" do
        expect(@apple.azucares).not_to be_nil
        expect(@apple.azucares).to be >= 0
        expect(@apple.azucares).to eq(20.62)
      end
      it "Proteínas correctamente indicadas" do
        expect(@apple.proteinas).not_to be_nil
        expect(@apple.proteinas).to be >= 0
        expect(@apple.proteinas).to eq(0.63)
      end
      it "Sal correctamente indicada" do
        expect(@apple.sal).not_to be_nil
        expect(@apple.sal).to be >= 0
        expect(@apple.sal).to eq(2.4)
      end
    end




  end






end
