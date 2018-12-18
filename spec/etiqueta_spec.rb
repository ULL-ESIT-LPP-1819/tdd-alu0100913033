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


    it " * Nodo vacío creado correctamente" do
      @node_empty = Etiqueta::Node.new(nil, nil, nil)
      expect(@node_empty.empty?).to eq(true)
    end

    it " * Se introduce el valor del nodo correctamente" do
      expect(@node.value).to eq(@apple)
    end

    it " * Insertar un nuevo nodo en el HEAD" do
      @node.insert_head(@apple2)              # [manzana1, manzana2]
      expect(@node.gethead.value).to eq(@apple2)   #     0         1
    end

    it " * Insertar un nuevo nodo en el TAIL" do
      @node.insert_tail(@apple3)              #[manzana3, manzana1, manzana2]
      expect(@node.gettail.value).to eq(@apple3)  #   -1        0         1
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
      expect(@node.to_s).to eq([@apple3, @apple, @apple2, @apple3, @apple])
    end

    it " * Mostrar el DLL inversamente" do
      expect(@node.to_s.reverse).to eq([@apple, @apple3, @apple2, @apple, @apple3])
    end

    #it " * Ordenador la lista" do
    #  @node.sort_by { |x, y| x.value,sal <=> y.value.sal}
    #  expect(@node.to_s).to eq("[2.2, 2.4, 2.5, 2.2, 2.4]")
    #end


  end # context

  context " # -------->Práctica#09" do
    before :all do
      @manzana = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
      @pera = Etiqueta::Etiqueta.new("pera", 170.0, 0.17, 0.02, 0.04, 0.07, 1.02, 0.0, 3.74, 46.49, 253.67, 18.02, 18.23, 0.73, 3.57)
      @apple = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
      @apple2 = Etiqueta::Etiqueta.new("manzana2", 199.1, 0.71, 0.13, 0.29, 0.22, 2.79, 0.0, 4.05, 72.83, 289.19, 22.81, 20.6, 0.64, 2.5)
      @apple3 = Etiqueta::Etiqueta.new("manzana3", 189.1, 0.69, 0.11, 0.27, 0.20, 2.76, 0.0, 4.02, 72.79, 288.82, 21.99, 20.4, 0.61, 2.2)
      @node = Etiqueta::Node.new(@apple, nil, nil)
      @node.insert_head(@apple2)
      @node.insert_head(@apple3)
      @node.insert_head(@apple)
      @node.insert_tail(@apple3)
    end

    it " -------->* Comparación < entre dos etiquetas" do
      #La pera aporta menos calorías que la manzana
      expect(@pera < @manzana).to be_truthy
    end
    it " -------->* Comparación > entre dos etiquetas" do
      expect(@manzana > @pera).to be_truthy
    end
    it " -------->* Comparación <= entre dos etiquetas" do
      #La pera aporta menos calorías que la manzana
      expect(@pera <= @manzana).to be_truthy
    end
    it " -------->* Comparación >= entre dos etiquetas" do
      expect(@manzana >= @pera).to be_truthy
    end
    it " -------->* Comparación == entre dos etiquetas" do
      expect(@manzana == @manzana).to be_truthy
    end
    it " -------->* Comparación != entre dos etiquetas" do
      expect(@manzana != @pera).to be_truthy
    end

    it " -------->* Comparación 'between'" do
      expect(@pera.between?(@pera, @manzana)).to be_truthy
    end

    it " -------->* Enumerable - Collect" do
      expect(@node.collect{ |i| i.nombre}).to eq(["manzana3", "manzana", "manzana2", "manzana3", "manzana"])
      expect(@node.collect{ |i| i.nombre*2}).to eq(["manzana3manzana3", "manzanamanzana", "manzana2manzana2", "manzana3manzana3", "manzanamanzana"])
      expect(@node.collect{ |i| i.nombre + "!!!"}).to eq(["manzana3!!!", "manzana!!!", "manzana2!!!", "manzana3!!!", "manzana!!!"])
    end

    it " -------->* Enumerable - Select" do
      # No hay ninguna pera en el nodo
      expect(@node.select{ |i| i == @pera }).to eq([])
      # Seleccionar aquellas etiquetas de tipo manzana
      expect(@node.select{ |i| i == @apple}).to eq([@apple])
    end

    it " -------->* Enumerable - Max" do
      #El maximo debería ser de "manzana"
      expect(@node.max{ |i| i.sal}).to eq(@apple)
      expect(@node.max{ |i| i.cantidad}).not_to eq(@pera)
    end

    it " -------->* Enumerable - Min" do
      #El mínimo no debería ser de "manzana"
      expect(@node.min{ |i| i.sal}).not_to eq(@apple)
      expect(@node.min{ |i| i.cantidad}).to eq(@apple3)
    end

    it " -------->* Enumerable - Sort" do
      #Ordenar por Cantidad
      expect(@node.sort{ |i, j| i.cantidad<=>j.cantidad}).to eq([@apple3, @apple3, @apple2, @apple, @apple])
      #Ordenar inversamente por grasas saturadas
      expect(@node.sort{ |i, j| j.cantidad<=>i.cantidad}).to eq([@apple, @apple, @apple2, @apple3, @apple3])
    end

  end # Práctica#09

  context "# Práctica#11" do

    before :all do
      @white_chocolate = Etiqueta::Etiqueta.new("Chocolate blanco", 100.0, 30.9, 18.2, 9.9, 1.1, 0.0, 0.0, 0.8, 57.04, 766.1, 58.8, 59.0, 8.0, 0.1)
      @meal = Etiqueta::Etiqueta.new("Filete empanado", 100.0, 18.11, 4.81, 7.5, 4.16, 0.0, 0.0, 0.13, 91.7, 1035.28, 12.01, 0.2, 21.91, 5.98)
      @strawberry_jaw = Etiqueta::Etiqueta.new("Mermelada de fresa", 25.0, 0.05, 0.0, 0.03, 0.0, 0.0, 0.0, 0.2, 27.53, 23.32, 15.65, 13.54, 0.08, 1.25)


      ######## Listas de alimentos ########
      @Nodo = Etiqueta::Node.new(@apple, nil, nil)
      @Nodo.insert_head(@apple2)
      @Nodo.insert_head(@apple3)
      @Nodo.insert_head(@white_chocolate)
      # @Nodo = [@apple, @apple2, @apple3, @white_chocolate]

      @Nodo2 = Etiqueta::Node.new(@white_chocolate, nil, nil)
      @Nodo2.insert_head(@meal)
      @Nodo2.insert_head(@meal)
      @Nodo2.insert_head(@meal)
      # @Nodo2 = [@white_chocolate, @meal, @meal, @meal]

      @Nodo3 = Etiqueta::Node.new(@strawberry_jaw, nil, nil)
      @Nodo3.insert_head(@strawberry_jaw)
      @Nodo3.insert_head(@meal)
      @Nodo3.insert_head(@apple3)
      # @Nodo3 = [@strawberry_jaw, @strawberry_jaw, @meal, @apple3]

      @Nodo4 = Etiqueta::Node.new(@white_chocolate, nil, nil)
      @Nodo4.insert_head(@strawberry_jaw)
      @Nodo4.insert_head(@meal)
      @Nodo4.insert_head(@apple3)
      # @Nodo4 = [@white_chocolate, @strawberry_jaw, @meal, @apple3]

      @Nodo5 = Etiqueta::Node.new(@apple3, nil, nil)
      @Nodo5.insert_head(@apple3)
      @Nodo5.insert_head(@white_chocolate)
      @Nodo5.insert_head(@apple2)
      # @Nodo5 = [@apple3, @apple3, @white_chocolate, @apple2]

      @Nodo6 = Etiqueta::Node.new(@apple3, nil, nil)
      @Nodo6.insert_head(@white_chocolate)
      @Nodo6.insert_head(@white_chocolate)
      @Nodo6.insert_head(@meal)
      @Nodo6.insert_head(@meal)
      @Nodo6.insert_head(@white_chocolate)
      @Nodo6.insert_head(@apple2)
      # @Nodo6 = [@apple3, @white_chocolate, @white_chocolate, @meal, @meal, @white_chocolate, @apple2]

      @Nodo7 = Etiqueta::Node.new(@strawberry_jaw, nil, nil)
      @Nodo7.insert_head(@strawberry_jaw)
      @Nodo7.insert_head(@white_chocolate)
      @Nodo7.insert_head(@apple2)
      @Nodo7.insert_head(@apple)
      # @Nodo7 = [@strawberry_jaw, @strawberry_jaw, @white_chocolate, @apple2, @apple]

      @Nodo8 = Etiqueta::Node.new(@apple2, nil, nil)
      @Nodo8.insert_head(@apple)
      @Nodo8.insert_head(@meal)
      @Nodo8.insert_head(@meal)
      @Nodo8.insert_head(@white_chocolate)
      # @Nodo8 = [@apple2, @apple, @meal, @meal, @white_chocolate]

      @Nodo9 = Etiqueta::Node.new(@white_chocolate, nil, nil)
      @Nodo9.insert_head(@white_chocolate)
      @Nodo9.insert_head(@white_chocolate)
      @Nodo9.insert_head(@white_chocolate)
      @Nodo9.insert_head(@white_chocolate)
      @Nodo9.insert_head(@white_chocolate)
      @Nodo9.insert_head(@white_chocolate)
      @Nodo9.insert_head(@white_chocolate)
      @Nodo9.insert_head(@white_chocolate)
      @Nodo9.insert_head(@white_chocolate)
      @Nodo9.insert_head(@white_chocolate)
      @Nodo9.insert_head(@apple2)
      # @Nodo9 = [@white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate.... , @apple2]

      #########Menús creados#########
      @Menu_node = Etiqueta::MenuDietetico.new(@node) #[@apple3, @apple, @apple2, @apple3, @apple]
      @Menu = Etiqueta::MenuDietetico.new(@Nodo)      #[@apple, @apple2, @apple3, @white_chocolate]
      @Menu2 = Etiqueta::MenuDietetico.new(@Nodo2)    #[@white_chocolate, @meal, @meal, @meal]
      @Menu3 = Etiqueta::MenuDietetico.new(@Nodo3)    #[@strawberry_jaw, @strawberry_jaw, @meal, @apple3]
      @Menu4 = Etiqueta::MenuDietetico.new(@Nodo4)    #[@white_chocolate, @strawberry_jaw, @meal, @apple3]
      @Menu5 = Etiqueta::MenuDietetico.new(@Nodo5)    #[@apple3, @apple3, @white_chocolate, @apple2]
      @Menu6 = Etiqueta::MenuDietetico.new(@Nodo6)    #[@apple3, @white_chocolate, @white_chocolate, @meal, @meal, @white_chocolate, @apple2]
      @Menu7 = Etiqueta::MenuDietetico.new(@Nodo7)    #[@strawberry_jaw, @strawberry_jaw, @white_chocolate, @apple2, @apple]
      @Menu8 = Etiqueta::MenuDietetico.new(@Nodo8)    #[@apple2, @apple, @meal, @meal, @white_chocolate]
      @Menu9 = Etiqueta::MenuDietetico.new(@Nodo9)    #[@white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate.... , @apple2]



      end

      it "Representación de diez menús dietéticos mediante un Array" do
        my_array = [@Menu_node, @Menu, @Menu2, @Menu3, @Menu4, @Menu5, @Menu6, @Menu7, @Menu8, @Menu9]
        expect(my_array.length).to eq(10)
        expect(my_array.class).to eq(Array)
      end

  end # Práctica#11



end # RSpec.describe Etiqueta
