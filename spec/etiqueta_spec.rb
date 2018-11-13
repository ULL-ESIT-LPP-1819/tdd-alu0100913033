require 'spec_helper'
require 'etiqueta'

RSpec.describe Etiqueta do

   #Creación correcta de una clase
  context "# Inicialización de la clase etiqueta" do
    it "Se crea una etiqueta \"manzana\" correctamente" do
      apple = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
    end
  end # context

  # Existencia de los parámetros
  context "# Comprobar parámetros de la clase" do
    before :each  do
      @apple = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
    end


    describe @apple do
      it " * Nombre bien especificado" do
        expect(@apple.nombre).to eq("manzana")
      end
      it " * Cantidad de producto" do
        expect(@apple.cantidad).not_to be_nil
        expect(@apple.cantidad).to be >=0
        expect(@apple.cantidad).to eq(200.0)
      end
      it " * Grasas correctamente indicadas" do
        expect(@apple.grasas).not_to be_nil
        expect(@apple.grasas).to be >= 0
        expect(@apple.grasas).to eq(0.72)
      end
      it " * Grasas saturadas correctamente indicadas" do
        expect(@apple.grasas_sat).not_to be_nil
        expect(@apple.grasas_sat).to be >= 0
        expect(@apple.grasas_sat).to eq(0.12)
      end
      it " * Grasas monoinsaturadas correctamente indicadas" do
        expect(@apple.grasas_mono).not_to be_nil
        expect(@apple.grasas_mono).to be >= 0
        expect(@apple.grasas_mono).to eq(0.30)
      end
      it " * Grasas poliinsaturadas correctamente indicadas" do
        expect(@apple.grasas_poli).not_to be_nil
        expect(@apple.grasas_poli).to be >= 0
        expect(@apple.grasas_poli).to eq(0.21)
      end
      it " * Polialcoholes correctamente indicados" do
        expect(@apple.polialcoholes).not_to be_nil
        expect(@apple.polialcoholes).to be >= 0
        expect(@apple.polialcoholes).to eq(2.78)
      end
      it " * Almidón correctamente indicado" do
        expect(@apple.almidon).not_to be_nil
        expect(@apple.almidon).to be >= 0
        expect(@apple.almidon).to eq(0)
      end
      it " * Fibra correctamente indicada" do
        expect(@apple.fibra).not_to be_nil
        expect(@apple.fibra).to be >= 0
        expect(@apple.fibra).to eq(4.04)
      end
      it " * Vitaminas correctamente indicadas" do
        expect(@apple.vitaminas).not_to be_nil
        expect(@apple.vitaminas).to be >= 0
        expect(@apple.vitaminas).to eq(0.07282)
      end
      it " * Minerales correctamente indicados" do
        expect(@apple.minerales).not_to be_nil
        expect(@apple.minerales).to be >= 0
        expect(@apple.minerales).to eq(0.28918)
      end
      it " * Hidratos de carbono correctamente indicados" do
        expect(@apple.hidratos).not_to be_nil
        expect(@apple.hidratos).to be >= 0
        expect(@apple.hidratos).to eq(22.8)
      end
      it " * Azúcares correctamente indicados" do
        expect(@apple.azucares).not_to be_nil
        expect(@apple.azucares).to be >= 0
        expect(@apple.azucares).to eq(20.62)
      end
      it " * Proteínas correctamente indicadas" do
        expect(@apple.proteinas).not_to be_nil
        expect(@apple.proteinas).to be >= 0
        expect(@apple.proteinas).to eq(0.63)
      end
      it " * Sal correctamente indicada" do
        expect(@apple.sal).not_to be_nil
        expect(@apple.sal).to be >= 0
        expect(@apple.sal).to eq(2.4)
      end
    end # describe

  end # context

  context "# \"Por 100g o 100ml de producto\" devuelve valores correctos" do
    before :each do
      @apple = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
    end

    it " * Valor energético en kJ/g por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.valor_energetico_kj)).to eq(212.475)
    end
    it " * Valor energético en kcal/g por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.valor_energetico_kcal)).to eq(50.1)
    end
    it " * Grasas totales por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.grasas)).to eq(0.36)
    end
    it " * Grasas saturadas por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.grasas_sat)).to eq(0.06)
    end
    it " * Grasas monoinsaturadas por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.grasas_mono)).to eq(0.15)
    end
    it " * Grasas poliinsaturadas por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.grasas_poli)).to eq(0.105)
    end
    it " * Hidratos de carbono por porción de 100g o 100m correctol" do
      expect(@apple.cien(@apple.hidratos)).to eq(11.4)
    end
    it " * Azúcares por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.azucares)).to eq(10.31)
    end
    it " * Polialcoholes por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.polialcoholes)).to eq(1.39)
    end
    it " * Almidón por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.almidon)).to eq(0.0)
    end
    it " * Fibra alimentaria por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.fibra)).to eq(2.02)
    end
    it " * Proteínas por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.proteinas)).to eq(0.315)
    end
    it " * Sal por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.sal)).to eq(1.2)
    end
    it " * Vitaminas por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.vitaminas)).to eq(0.03641)
    end
    it " * Minerales por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.minerales)).to eq(0.14459)
    end

  end # context

  context "# IR + IR(Por 100g o 100ml de producto)" do
    before :each do
      @apple = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
    end

    it " * IR - Valor energético en kJ/g por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.ir_("julios"))).to eq(2.5294642857142855)
    end
    it " * IR - Valor energético en kcal/g por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.ir_("calorias"))).to eq(2.505)
    end
    it " * IR - Grasas por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.ir_("grasas"))).to eq(0.5142857142857142)
    end
    it " * IR - Ácidos por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.ir_("ácidos"))).to eq(0.3)
    end
    it " * IR - Hidratos por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.ir_("hidratos"))).to eq(4.384615384615385)
    end
    it " * IR - Azúcares por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.ir_("azúcares"))).to eq(11.455555555555556)
    end
    it " * IR - Proteínas por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.ir_("proteínas"))).to eq(0.63)
    end
    it " * IR - Sal por porción de 100g o 100ml correcto" do
      expect(@apple.cien(@apple.ir_("sal"))).to eq(20.0)
    end

  end # context

  context "# Mostrar la etiqueta nutricional" do
    before :each do
      @apple = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
    end

    it " * La etiqueta se muestra correctamente" do
      expect(@apple.to_s).to eq("                          ||  Por 100g o 100 ml  ||        IR         ||     Por       ||            IR
                          ||    de producto      || (por 100g 0 100ml ||    porción    || (por porción de #{@apple.cantidad.round(2)}
                          ||                     ||    de producto)   ||    de #{@apple.cantidad.round(2)}   ||     g de producto)
       __________________________________________________________________________________________________________
        Valor energético  ||#{sprintf('      %.2f kJ', @apple.cien(@apple.valor_energetico_kj)).ljust(21)}||#{sprintf('       %.2f %%', @apple.cien(@apple.ir_("julios"))).ljust(19)}||#{sprintf('   %.2f kJ', @apple.valor_energetico_kj).ljust(15)}||#{sprintf('         %.2f %%', @apple.ir_("julios")).ljust(21)}
                          ||#{sprintf('      %.2f kcal', @apple.cien(@apple.valor_energetico_kcal)).ljust(21)}||#{sprintf('       %.2f %%', @apple.cien(@apple.ir_("calorias"))).ljust(19)}||#{sprintf('   %.2f kcal', @apple.valor_energetico_kcal).ljust(15)}||#{sprintf('         %.2f %%', @apple.ir_("calorias")).ljust(21)}
       __________________________________________________________________________________________________________
        Grasas totales    ||#{sprintf('      %.2f g', @apple.cien(@apple.grasas)).ljust(21)}||#{sprintf('       %.2f %%', @apple.cien(@apple.ir_("grasas"))).ljust(19)}||#{sprintf('   %.2f g', @apple.grasas).ljust(15)}||#{sprintf('         %.2f %%', @apple.ir_("grasas")).ljust(21)}
              Saturadas ->||#{sprintf('      %.2f g', @apple.cien(@apple.grasas_sat)).ljust(21)}||#{sprintf('       %.2f %%', @apple.cien(@apple.ir_("ácidos"))).ljust(19)}||#{sprintf('   %.2f g', @apple.grasas_sat).ljust(15)}||#{sprintf('         %.2f %%', @apple.ir_("ácidos")).ljust(21)}
        Monoinsaturadas ->||#{sprintf('      %.2f g', @apple.cien(@apple.grasas_mono)).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f g', @apple.grasas_mono).ljust(15)}||#{sprintf('          -').ljust(21)}
        Poliinsaturadas ->||#{sprintf('      %.2f g', @apple.cien(@apple.grasas_poli)).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f g', @apple.grasas_poli).ljust(15)}||#{sprintf('          -').ljust(21)}
        __________________________________________________________________________________________________________
        Hidratos          ||#{sprintf('      %.2f g', @apple.cien(@apple.hidratos)).ljust(21)}||#{sprintf('       %.2f %%', @apple.cien(@apple.ir_("hidratos"))).ljust(19)}||#{sprintf('   %.2f g', @apple.hidratos).ljust(15)}||#{sprintf('         %.2f %%', @apple.ir_("hidratos")).ljust(21)}
               Azúcares ->||#{sprintf('      %.2f g', @apple.cien(@apple.azucares)).ljust(21)}||#{sprintf('       %.2f %%', @apple.cien(@apple.ir_("azúcares"))).ljust(19)}||#{sprintf('   %.2f g', @apple.azucares).ljust(15)}||#{sprintf('         %.2f %%', @apple.ir_("azúcares")).ljust(21)}
          Polialcoholes ->||#{sprintf('      %.2f g', @apple.cien(@apple.polialcoholes)).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f g', @apple.polialcoholes).ljust(15)}||#{sprintf('          -').ljust(21)}
                Almidón ->||#{sprintf('      %.2f g', @apple.cien(@apple.almidon)).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f g', @apple.almidon).ljust(15)}||#{sprintf('          -').ljust(21)}
        __________________________________________________________________________________________________________
        Fibra alimentaria ||#{sprintf('      %.2f g', @apple.cien(@apple.fibra)).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f g', @apple.fibra).ljust(15)}||#{sprintf('          -').ljust(21)}
        __________________________________________________________________________________________________________
        Proteínas         ||#{sprintf('      %.2f g', @apple.cien(@apple.proteinas)).ljust(21)}||#{sprintf('       %.2f %%', @apple.cien(@apple.ir_("proteínas"))).ljust(19)}||#{sprintf('   %.2f g', @apple.proteinas).ljust(15)}||#{sprintf('         %.2f %%', @apple.ir_("proteínas")).ljust(21)}
        __________________________________________________________________________________________________________
        Sal               ||#{sprintf('      %.2f g', @apple.cien(@apple.sal)).ljust(21)}||#{sprintf('       %.2f %%', @apple.cien(@apple.ir_("sal"))).ljust(19)}||#{sprintf('   %.2f g', @apple.sal).ljust(15)}||#{sprintf('         %.2f %%', @apple.ir_("sal")).ljust(21)}


                                                      VITAMINAS Y MINERALES
        __________________________________________________________________________________________________________
        Vitaminas         ||#{sprintf('      %.2f mg', (@apple.cien(@apple.vitaminas))*1000).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f mg', @apple.vitaminas * 1000).ljust(15)}||#{sprintf('          -').ljust(21)}
        minerales         ||#{sprintf('      %.2f mg', (@apple.cien(@apple.minerales))*1000).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f mg', @apple.minerales * 1000).ljust(15)}||#{sprintf('          -').ljust(21)}


  ")
      @apple.to_s
    end


  end # context

  context "# Práctica#07: POO y dll" do
    before :each do
      @apple = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
      @apple2 = Etiqueta::Etiqueta.new("manzana2", 199.1, 0.71, 0.13, 0.29, 0.22, 2.79, 0.0, 4.05, 72.83, 289.19, 22.81, 20.6, 0.64, 2.5)
      @apple3 = Etiqueta::Etiqueta.new("manzana3", 189.1, 0.69, 0.11, 0.27, 0.20, 2.76, 0.0, 4.02, 72.79, 288.82, 21.99, 20.4, 0.61, 2.2)
      @node = Etiqueta::Node.new(@apple, nil, nil)
    end

    it " * Se introduce el valor del nodo correctamente" do
      expect(@node.value).to eq(@apple)
    end

    it " * Insertar un nuevo nodo en el HEAD" do
      @node.insert_head(@apple2)              # [manzana1, manzana2]
      expect(@node[1].value).to eq(@apple2)   #     0         1
    end

    it " * Insertar un nuevo nodo en el TAIL" do
      @node.insert_tail(@apple3)              #[manzana3, manzana1, manzana2]
      expect(@node[-1].value).to eq(@apple3)  #   -1        0         1
    end

    it " * Eliminación de un nodo del HEAD" do
      @node.remove_head                       #[manzana3, manzana1]
      expect(@node.next).to eq(nil)           #   -1        0
    end

    it " * Eliminación de un nodo en el TAIL" do
      @node.remove_tail                       # [manzana]
      expect(@node.prev).to eq(nil)           #     0
    end

    before :each do
      # [manzana3, manzana, manzana2, manzana3, manzana]
      @node.insert_head(@apple2)
      @node.insert_head(@apple3)
      @node.insert_head(@apple)
      @node.insert_tail(@apple3)
    end


    it " * Obtención del TAIL correcta" do
      expect(@node.gettail.value).to eq(@apple3)
    end

    it " * Obtención del HEAD correcta" do
      expect(@node.gethead.value).to eq(@apple)
    end

    it " * La DLL se muestra correctamente" do
      expect(@node.to_s).to eq("[2.2, 2.4, 2.5, 2.2, 2.4]")
    end

    it " * Mostrar el DLL inversamente" do
      expect(@node.to_s_reverse).to eq("[2.4, 2.2, 2.5, 2.4, 2.2]")
    end

  end # context



end # RSpec.describe Etiqueta
