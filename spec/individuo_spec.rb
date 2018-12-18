require 'spec_helper'
require 'etiqueta/individuo'
require 'benchmark'


RSpec.describe Persona do

  before :all do
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
    @Menu_dietetico = Persona::MenuDietetico.new(@node)

    @Jose = Persona::Persona.new("José", 22, 1, 1, @Menu_dietetico)
    @Datos = Persona::DatosAntropometricos.new("José", 90, 1.65, 22, 1, 90.0, 95.0, 1, @Menu_dietetico)


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
      # expect(Persona::DatosAntropometricos.ancestors).to eq([Persona::DatosAntropometricos, Persona::Persona, Etiqueta::Node, Struct, Enumerable, Object, PP::ObjectMixin, Kernel, BasicObject])
      expect(Persona::DatosAntropometricos.superclass).to eq(Persona::Persona)
      expect(Persona::Persona.superclass).to eq(Object)
    end
  end # Comprobar clase, tipo y jerarquía

  context "# Lista de cinco individuos" do
    before :all do
      @Datos_Jose = @Datos
      @Nodo = Etiqueta::Node.new(@Datos_Jose, nil, nil)
      @Datos_Camilo = Persona::DatosAntropometricos.new("Camilo", 87, 1.71, 32, 1, 90.2, 93.1, 1, @Menu_dietetico)
      @Datos_Ana = Persona::DatosAntropometricos.new("Ana", 52, 1.71, 19, 0, 50.2, 60.2, 0, @Menu_dietetico)
      @Datos_Fatima = Persona::DatosAntropometricos.new("Fátima", 57, 1.67, 26, 0, 54.2, 66.3, 0, @Menu_dietetico)
      @Datos_Pedro = Persona::DatosAntropometricos.new("Pedro", 77, 1.77, 28, 1, 69.3, 70.1, 1, @Menu_dietetico)
      @Nodo.insert_head(@Datos_Camilo)
      @Nodo.insert_head(@Datos_Ana)
      @Nodo.insert_head(@Datos_Fatima)
      @Nodo.insert_head(@Datos_Pedro)
      # [José, Camilo, Ana, Fátima, Pedro]
    end

    it "* Lista creada correctamente" do
      expect(@Nodo.class).to eq(Etiqueta::Node)
      #expect(@Nodo.to_s).to eq("["José", "Camilo", "Ana", "Fátima", "Pedro"]")
      # [0.9473, 0.9688, 0.8338, 0.8174, 0.9885]"
      # debe ser:
      # [0.8174,    0.8338,   0.9473,   0.9688,     0.9885]
      # [Fátima,    Ana,      José,     Camilo,     Pedro ]

    end

    #it "* Los individuos han sido ordenados" do
    #end

  end # Lista de cinco individuos

  context " # -------->Práctica#09" do
    before :each do
      @Datos_Jose = @Datos
      @Nodo = Etiqueta::Node.new(@Datos_Jose, nil, nil)
      @Datos_Camilo = Persona::DatosAntropometricos.new("Camilo", 87, 1.71, 32, 1, 90.2, 93.1, 1, @Menu_dietetico)
      @Datos_Ana = Persona::DatosAntropometricos.new("Ana", 52, 1.71, 19, 0, 50.2, 60.2, 0, @Menu_dietetico)
      @Datos_Fatima = Persona::DatosAntropometricos.new("Fátima", 57, 1.67, 26, 0, 54.2, 66.3, 0, @Menu_dietetico)
      @Datos_Pedro = Persona::DatosAntropometricos.new("Pedro", 77, 1.77, 28, 1, 69.3, 70.1, 1, @Menu_dietetico)
      @Datos_Nina = Persona::DatosAntropometricos.new("Nina", 52, 1.71, 92, 0, 50.2, 60.2, 0, @Menu_dietetico)
      @Nodo.insert_head(@Datos_Camilo)
      @Nodo.insert_head(@Datos_Ana)
      @Nodo.insert_head(@Datos_Fatima)
      @Nodo.insert_head(@Datos_Pedro)
    end

    it " -------->* Comparación < entre dos individuos" do
      #Ana tiene menos icm que Camilo
      expect(@Datos_Ana < @Datos_Camilo).to be_truthy
    end
    it " -------->* Comparación > entre dos individuos" do
      expect(@Datos_Camilo > @Datos_Ana).to be_truthy
    end
    it " -------->* Comparación <= entre dos individuos" do
      expect(@Datos_Ana <= @Datos_Camilo).to be_truthy
    end
    it " -------->* Comparación >= entre dos individuos" do
      expect(@Datos_Camilo >= @Datos_Ana).to be_truthy
    end
    it " -------->* Comparación == entre dos individuos" do
      expect(@Datos_Camilo == @Datos_Camilo).to be_truthy
    end
    it " -------->* Comparación != entre dos individuos" do
      expect(@Datos_Camilo != @Datos_Ana).to be_truthy
    end
    it " -------->* Comparación between" do
      expect(@Datos_Fatima.between?(@Datos_Ana, @Datos_Camilo)).to be_truthy
    end


    it " -------->* Enumerable - Collect" do
      expect(@Nodo.collect{ |i| i.nombre}).to eq(["José", "Camilo", "Ana", "Fátima", "Pedro"])
      expect(@Nodo.collect{ |i| i.nombre*2}).to eq(["JoséJosé", "CamiloCamilo", "AnaAna", "FátimaFátima", "PedroPedro"])
      expect(@Nodo.collect{ |i| i.nombre + "!!!"}).to eq(["José!!!", "Camilo!!!", "Ana!!!", "Fátima!!!", "Pedro!!!"])
    end
    it " -------->* Enumerable - Select" do
      # Nina no existe en la lista
      expect(@Nodo.select{ |i| i == @Datos_Nina }).not_to eq([@Datos_Nina])
      # Comprobamos que José está en la lista
      expect(@Nodo.select{ |i| i == @Datos_Jose}).to eq([@Datos_Jose])
    end
    it " -------->* Enumerable - Max" do
      # El más pesado debería ser José
      expect(@Nodo.max{ |i, j| i.peso<=>j.peso}).to eq(@Datos_Jose)
      # El más viejo es Camilo
      expect(@Nodo.max{ |i, j| i.edad<=>j.edad}).to eq(@Datos_Camilo)
    end
    it " -------->* Enumerable - Min" do
      # El menos pesado debería ser Ana o Fátima
      expect(@Nodo.min{ |i, j| i.peso<=>j.peso}).to eq(@Datos_Ana || @Datos_Fatima)
      # El más jóven de todos es Ana
      expect(@Nodo.min{ |i, j| i.edad<=>j.edad}).to eq(@Datos_Ana)
    end
    it " -------->* Enumerable - Sort" do
      # Ordenar por el peso
      expect(@Nodo.sort{ |i, j| i.peso<=>j.peso}).to eq([@Datos_Ana, @Datos_Fatima, @Datos_Pedro, @Datos_Camilo, @Datos_Jose])
      # Ordenar inversamente por peso
      expect(@Nodo.sort{ |i, j| j.peso<=>i.peso}).to eq([@Datos_Jose, @Datos_Camilo, @Datos_Pedro, @Datos_Fatima, @Datos_Ana])
    end
  end # -------->Práctica#09


  context "Práctica #10" do

    before :all do
    #Creación de la lista de alimentos (comer 3 manzanas) y una tableta entera de chocolate blanco (la gula pasa factura)
    @apple = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
    @apple2 = Etiqueta::Etiqueta.new("manzana2", 199.1, 0.71, 0.13, 0.29, 0.22, 2.79, 0.0, 4.05, 72.83, 289.19, 22.81, 20.6, 0.64, 2.5)
    @apple3 = Etiqueta::Etiqueta.new("manzana3", 189.1, 0.69, 0.11, 0.27, 0.20, 2.76, 0.0, 4.02, 72.79, 288.82, 21.99, 20.4, 0.61, 2.2)
    @white_chocolate = Etiqueta::Etiqueta.new("Chocolate blanco", 100.0, 30.9, 18.2, 9.9, 1.1, 0.0, 0.0, 0.8, 57.04, 766.1, 58.8, 59.0, 8.0, 0.1)
    @Nodo = Etiqueta::Node.new(@apple, nil, nil)
    @Nodo.insert_head(@apple2)
    @Nodo.insert_head(@apple3)
    @Nodo.insert_head(@white_chocolate)
    # @Nodo = ["manzana", "manzana2", "manzana3", "Chocolate blanco"]
    @Menu_Dietetico = Persona::MenuDietetico.new(@Nodo)


    # Personas que han seguido esta dieta (hombre y mujer)
    @Datos_Camilo = Persona::DatosAntropometricos.new("Camilo", 87, 1.71, 32, 1, 90.2, 93.1, 1, @Menu_Dietetico)
    @Datos_Ana = Persona::DatosAntropometricos.new("Ana", 52, 1.68, 19, 0, 50.2, 60.2, 0, @Menu_Dietetico)

    # Seguimiento del menú sobre Ana y Camilo
    @Menu_Camilo = Persona::ValoracionNutricional.new(@Datos_Camilo, "Actividad moderada")
    @Menu_Ana = Persona::ValoracionNutricional.new(@Datos_Ana, "Reposo")
    end

    context "Pruebas relativas a la clase" do
      it "Comprobar el peso teórico inicial" do
        # Expectativas de peso ideal esperado teóricamente
        expect(@Menu_Camilo.peso_teorico_inicial).to eq(65.75)
        expect(@Menu_Ana.peso_teorico_inicial).to eq(63.5)
      end

      it "Comprobar el gasto energético basal" do
        expect(@Menu_Camilo.gasto_energetico_basal).to eq(1783.75)
        expect(@Menu_Ana.gasto_energetico_basal).to eq(1480.0)
      end

      it "Comprobar el efecto termógeno" do
        # El efecto termógeno debe ser el 10% del gasto energético basal
        expect(@Menu_Camilo.efecto_termogeno).to eq(@Menu_Camilo.gasto_energetico_basal * 0.1)
        expect(@Menu_Ana.efecto_termogeno).to eq(@Menu_Ana.gasto_energetico_basal * 0.1)
      end

      it "Comprobar el gasto por actividad física" do
        # Se espera que Ana no tenga gastos por actividad física, dado que siempre está en reposo
        expect(@Menu_Camilo.gasto_por_actividad_fisica).to eq(481.6125)
        expect(@Menu_Ana.gasto_por_actividad_fisica).to eq(0)
      end

      it "Comprobar el gasto energético total" do
        expect(@Menu_Camilo.gasto_energetico_total).to eq(2443.7375)
        expect(@Menu_Ana.gasto_energetico_total).to eq(1628.0)
      end

    end # Pruebas relativas a la clase

    context "Verificación alimenticia" do
      it "La alimentación es insuficiente" do
        # con 3 manzanas y una tableta de chocolate no se cubre ni de lejos las necesidades calóricas diarias
        expect(@Menu_Camilo.necesidad_alimenticia).to eq("Alimentación insuficiente")
        expect(@Menu_Ana.necesidad_alimenticia).to eq("Alimentación insuficiente")
      end

      it "La alimentación es suficiente" do
        # Añadimos 3 filetes empanados a Camilo y 1 a Ana
        @meal = Etiqueta::Etiqueta.new("Filete empanado", 100.0, 18.11, 4.81, 7.5, 4.16, 0.0, 0.0, 0.13, 91.7, 1035.28, 12.01, 0.2, 21.91, 5.98)
        @Nodo.insert_head(@meal)
        @Nodo.insert_head(@meal)
        @Nodo.insert_head(@meal)
        @Datos_Pedro = Persona::DatosAntropometricos.new("Pedro", 77, 1.77, 28, 1, 69.3, 70.1, 1, @Menu_Dietetico)
        @Menu_Pedro = Persona::ValoracionNutricional.new(@Datos_Pedro, "Actividad intensa")

        # Para camilo es suficiente porque realiza actividad física y requiere más calorías.
        expect(@Menu_Camilo.necesidad_alimenticia).to eq("Alimentación suficiente")
        expect(@Menu_Pedro.necesidad_alimenticia).to eq("Alimentación suficiente")
      end

      it "La alimentación es excesiva" do

        # Ana tiene una vida sedentaria y requiere menos calorías.
        expect(@Menu_Ana.necesidad_alimenticia).to eq("Alimentación excesiva")
      end

    end # Verificación alimenticia

  end # Práctica #10


  context "# Práctica#11   ------   Menús dietéticos" do

    before :all do
      @apple = Etiqueta::Etiqueta.new("manzana", 200.0, 0.72, 0.12, 0.30, 0.21, 2.78, 0.0, 4.04, 72.82, 289.18, 22.80, 20.62, 0.63, 2.4)
      @apple2 = Etiqueta::Etiqueta.new("manzana2", 199.1, 0.71, 0.13, 0.29, 0.22, 2.79, 0.0, 4.05, 72.83, 289.19, 22.81, 20.6, 0.64, 2.5)
      @apple3 = Etiqueta::Etiqueta.new("manzana3", 189.1, 0.69, 0.11, 0.27, 0.20, 2.76, 0.0, 4.02, 72.79, 288.82, 21.99, 20.4, 0.61, 2.2)
      @white_chocolate = Etiqueta::Etiqueta.new("Chocolate blanco", 100.0, 30.9, 18.2, 9.9, 1.1, 0.0, 0.0, 0.8, 57.04, 766.1, 58.8, 59.0, 8.0, 0.1)
      @meal = Etiqueta::Etiqueta.new("Filete empanado", 100.0, 18.11, 4.81, 7.5, 4.16, 0.0, 0.0, 0.13, 91.7, 1035.28, 12.01, 0.2, 21.91, 5.98)
      @strawberry_jaw = Etiqueta::Etiqueta.new("Mermelada de fresa", 25.0, 0.05, 0.0, 0.03, 0.0, 0.0, 0.0, 0.2, 27.53, 23.32, 15.65, 13.54, 0.08, 1.25)


      ######## Listas de alimentos ########
      @node = Etiqueta::Node.new(@apple, nil, nil)
      @node.insert_head(@apple2)
      @node.insert_head(@apple3)
      @node.insert_head(@apple)
      @node.insert_head(@apple3)
      # @Nodo = [@apple, @apple2, @apple3, @apple, @apple3]


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
      @Menu_node = Persona::MenuDietetico.new(@node) #[@apple, @apple, @apple2, @apple3, @apple]
      @Menu = Persona::MenuDietetico.new(@Nodo)      #[@apple, @apple2, @apple3, @white_chocolate]
      @Menu2 = Persona::MenuDietetico.new(@Nodo2)    #[@white_chocolate, @meal, @meal, @meal]
      @Menu3 = Persona::MenuDietetico.new(@Nodo3)    #[@strawberry_jaw, @strawberry_jaw, @meal, @apple3]
      @Menu4 = Persona::MenuDietetico.new(@Nodo4)    #[@white_chocolate, @strawberry_jaw, @meal, @apple3]
      @Menu5 = Persona::MenuDietetico.new(@Nodo5)    #[@apple3, @apple3, @white_chocolate, @apple2]
      @Menu6 = Persona::MenuDietetico.new(@Nodo6)    #[@apple3, @white_chocolate, @white_chocolate, @meal, @meal, @white_chocolate, @apple2]
      @Menu7 = Persona::MenuDietetico.new(@Nodo7)    #[@strawberry_jaw, @strawberry_jaw, @white_chocolate, @apple2, @apple]
      @Menu8 = Persona::MenuDietetico.new(@Nodo8)    #[@apple2, @apple, @meal, @meal, @white_chocolate]
      @Menu9 = Persona::MenuDietetico.new(@Nodo9)    #[@white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate, @white_chocolate.... , @apple2]

      @my_array = [@Menu_node, @Menu, @Menu2, @Menu3, @Menu4, @Menu5, @Menu6, @Menu7, @Menu8, @Menu9]


      end

      it "Representación de diez menús dietéticos mediante un Array" do
        expect(@my_array.length).to eq(10)
        expect(@my_array.class).to eq(Array)
      end

      it "Obtener un nuevo array con los elementos ordenados usando bucles for" do

      my_array_copy = @my_array.map(&:clone)
      @my_array_sorted = Array.new(0)


        for j in 0.. @my_array.count-1
          min = @Menu9
          it = -1
          for i in 0..my_array_copy.count-1
                if my_array_copy[i].calorias_totales <= min.calorias_totales
                  min = my_array_copy[i]
                  it = i
                end
          end
          @my_array_sorted.push(min)
          my_array_copy.delete_at(it)
        end

      # Vemos que, efectivamente, el array queda correctamente ordenado
      expect(@my_array_sorted).to eq(@my_array.sort { |x, y|  x <=> y })

      end



      it "Obtener un nuevo array de elementos ordenados usando el método each" do
        sorting = Array.new(0)
        @my_array.each do |node|
          if sorting.empty?
            sorting.push(node)
          else
            i = 0
            while i < sorting.count
              if node <= sorting[i]
                sorting.insert(i, node)
                break
              end
              if i == sorting.count-1
                sorting.insert(i+1, node)
                break
              end
              i += 1
            end
          end
        end

        expect(sorting).to eq([@Menu_node, @Menu3, @Menu5, @Menu, @Menu7, @Menu4, @Menu8, @Menu2, @Menu6, @Menu9])
      end


      it "Obtener un nuevo array de elementos ordenados usando el método sort" do
        expect(@my_array.sort { |x, y|  x <=> y }).to eq([@Menu_node, @Menu3, @Menu5, @Menu, @Menu7, @Menu4, @Menu8, @Menu2, @Menu6, @Menu9])
      end


      it "Benchmark sobre los distintos métodos de ordenación" do
        n = n = 50000

        Benchmark.bm do |x|
          x.report('for:') {

            my_array_copy = @my_array.map(&:clone)
            @my_array_sorted = Array.new(0)


              for j in 0.. @my_array.count-1
                min = @Menu9
                it = -1
                for i in 0..my_array_copy.count-1
                      if my_array_copy[i].calorias_totales <= min.calorias_totales
                        min = my_array_copy[i]
                        it = i
                      end
                end
                @my_array_sorted.push(min)
                my_array_copy.delete_at(it)
              end

          }
          x.report('each')      {
            sorting = Array.new(0)
            @my_array.each do |node|
              if sorting.empty?
                sorting.push(node)
              else
                i = 0
                while i < sorting.count
                  if node <= sorting[i]
                    sorting.insert(i, node)
                    break
                  end
                  if i == sorting.count-1
                    sorting.insert(i+1, node)
                    break
                  end
                  i += 1
                end
              end
            end

          }
          x.report('sort')      { @my_array.sort { |x, y|  x <=> y }}
        end
      end

  end # Práctica#11   ------   Menús dietéticos
















  context "# Práctica#11   ------   Valores nutricionales" do
    before :all do
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
      ###Menús dietéticos###
      @Menu = Persona::MenuDietetico.new(@Nodo)      #[@apple, @apple2, @apple3, @white_chocolate]
      @Menu2 = Persona::MenuDietetico.new(@Nodo2)    #[@white_chocolate, @meal, @meal, @meal]
      @Menu3 = Persona::MenuDietetico.new(@Nodo9)    #[@strawberry_jaw, @strawberry_jaw, @meal, @apple3]

      #######Personas a valorar########
      @Datos_Pedro = Persona::DatosAntropometricos.new("Pedro", 77, 1.77, 28, 1, 69.3, 70.1, 1, @Menu)
      @Datos_Ana = Persona::DatosAntropometricos.new("Ana", 52, 1.68, 19, 0, 50.2, 60.2, 0, @Menu3)
      @Datos_Camilo = Persona::DatosAntropometricos.new("Camilo", 87, 1.71, 32, 1, 90.2, 93.1, 1, @Menu2)
      @Datos_Nina = Persona::DatosAntropometricos.new("Nina", 52, 1.71, 92, 0, 50.2, 60.2, 0, @Menu2)
      @Datos_Antonio = Persona::DatosAntropometricos.new("Antonio", 82, 1.77, 35, 1, 93.2, 93.1, 0, @Menu)
      @Datos_Manuel = Persona::DatosAntropometricos.new("Manuel", 88, 1.91, 35, 1, 99.2, 99.1, 1, @Menu2)
      @Datos_Felicia = Persona::DatosAntropometricos.new("Felicia", 110, 1.67, 52, 0, 120.2, 120.1, 1, @Menu3)
      @Datos_Paula = Persona::DatosAntropometricos.new("Paula", 51, 1.67, 21, 0, 50.2, 60.2, 0, @Menu)
      @Datos_Fatima = Persona::DatosAntropometricos.new("Fátima", 57, 1.67, 26, 0, 54.2, 66.3, 0, @Menu2)
      @Datos_Jose = Persona::DatosAntropometricos.new("José", 90, 1.65, 22, 1, 90.0, 95.0, 1, @Menu3)
      @Dato_minimo = Persona::DatosAntropometricos.new("Infinito", 9999999999999, 165.0, 22, 1, 90.0, 95.0, 1, @Menu3)


      ######Valoraciones nutricionales######
      @Menu_Pedro = Persona::ValoracionNutricional.new(@Datos_Pedro, "Actividad intensa")
      @Menu_Camilo = Persona::ValoracionNutricional.new(@Datos_Camilo, "Actividad moderada")
      @Menu_Ana = Persona::ValoracionNutricional.new(@Datos_Ana, "Reposo")
      @Menu_Nina = Persona::ValoracionNutricional.new(@Datos_Nina, "Reposo")
      @Menu_Fatima = Persona::ValoracionNutricional.new(@Datos_Fatima, "Actividad intensa")
      @Menu_Jose = Persona::ValoracionNutricional.new(@Datos_Jose, "Actividad moderada")
      @Menu_Antonio = Persona::ValoracionNutricional.new(@Datos_Antonio, "Actividad intensa")
      @Menu_Manuel = Persona::ValoracionNutricional.new(@Datos_Manuel, "Actividad ligera")
      @Menu_Felicia = Persona::ValoracionNutricional.new(@Datos_Felicia, "Reposo")
      @Menu_Paula = Persona::ValoracionNutricional.new(@Datos_Paula, "Reposo")
      @Menu_minimo = Persona::ValoracionNutricional.new( @Dato_minimo, "Actividad intensa")

      @node_vn = Etiqueta::Node.new(@Menu_Pedro, nil, nil)
      @node_vn.insert_head(@Menu_Ana)
      @node_vn.insert_head(@Menu_Camilo)
      @node_vn.insert_head(@Menu_Nina)
      @node_vn.insert_head(@Menu_Fatima)
      @node_vn.insert_head(@Menu_Jose)
      @node_vn.insert_head(@Menu_Antonio)
      @node_vn.insert_head(@Menu_Manuel)
      @node_vn.insert_head(@Menu_Felicia)
      @node_vn.insert_head(@Menu_Paula)

    end #before :all

    it "Representación de 10 valoraciones nutricionales de un individuo mediante una DLL" do


      expect(@node_vn.get_size).to eq(10)
      expect(@node_vn.class).to eq(Etiqueta::Node)

    end

    it "Obtener un nuevo array con los elementos ordenados usando bucles for" do
      @node_vn_copy = @node_vn.to_s
      @node_to_compare = @node_vn.to_s
      @node_vn_sorted = Etiqueta::Node.new(@Menu_minimo, nil, nil)
      #@node_vn_sorted = Array.new(0)


        for j in 0..@node_vn.get_size-1
          it = -1
          @Menu_minimo = Persona::ValoracionNutricional.new(@Dato_minimo, "Actividad intensa")
          for i in 0..@node_vn_copy.count-1
                if @node_vn_copy[i].gasto_energetico_basal <= @Menu_minimo.gasto_energetico_basal
                  @Menu_minimo = @node_vn_copy[i]
                  it = i
                end
          end

          @node_vn_sorted.insert_head(@Menu_minimo)
          #@node_vn_sorted.push(@Menu_minimo)
          @node_vn_copy.delete_at(it)

        end

        @node_vn_sorted.remove_tail

      # Vemos que, efectivamente, el array queda correctamente ordenado
      expect(@node_vn_sorted.to_s).to eq([@Menu_Nina, @Menu_Paula, @Menu_Ana, @Menu_Fatima, @Menu_Pedro, @Menu_Antonio, @Menu_Camilo, @Menu_Jose, @Menu_Felicia, @Menu_Manuel])

    end


    it "Obtener un nuevo array de elementos ordenados usando el método each" do
      sorting = Array.new(0)
      @node_vn.each do |node|
        if sorting.empty?
          sorting.push(node)
        else
          i = 0
          while i < sorting.count
            if node <= sorting[i]
              sorting.insert(i, node)
              break
            end
            if i == sorting.count-1
              sorting.insert(i+1, node)
              break
            end
            i += 1
          end
        end
      end

      expect(sorting).to eq([@Menu_Nina, @Menu_Paula, @Menu_Ana, @Menu_Fatima, @Menu_Pedro, @Menu_Antonio, @Menu_Camilo, @Menu_Jose, @Menu_Felicia, @Menu_Manuel])
    end


    it "Obtener un nuevo array de elementos ordenados usando el método sort" do
      expect(@node_vn.sort { |x, y|  x <=> y }).to eq([@Menu_Nina, @Menu_Paula, @Menu_Ana, @Menu_Fatima, @Menu_Pedro, @Menu_Antonio, @Menu_Camilo, @Menu_Jose, @Menu_Felicia, @Menu_Manuel])
    end

    it "Benchmark sobre los distintos métodos de ordenación" do
      n = n = 50000

      Benchmark.bm do |x|
      x.report {
        @node_vn_copy = @node_vn.to_s
        @node_to_compare = @node_vn.to_s
        @node_vn_sorted = Etiqueta::Node.new(@Menu_minimo, nil, nil)
        #@node_vn_sorted = Array.new(0)


          for j in 0..@node_vn.get_size-1
            it = -1
            @Menu_minimo = Persona::ValoracionNutricional.new(@Dato_minimo, "Actividad intensa")
            for i in 0..@node_vn_copy.count-1
                  if @node_vn_copy[i].gasto_energetico_basal <= @Menu_minimo.gasto_energetico_basal
                    @Menu_minimo = @node_vn_copy[i]
                    it = i
                  end
            end

            @node_vn_sorted.insert_head(@Menu_minimo)
            #@node_vn_sorted.push(@Menu_minimo)
            @node_vn_copy.delete_at(it)

          end

          @node_vn_sorted.remove_tail
      }
      x.report {
        sorting = Array.new(0)
        @node_vn.each do |node|
          if sorting.empty?
            sorting.push(node)
          else
            i = 0
            while i < sorting.count
              if node <= sorting[i]
                sorting.insert(i, node)
                break
              end
              if i == sorting.count-1
                sorting.insert(i+1, node)
                break
              end
              i += 1
            end
          end
        end
      }
      x.report { @node_vn.sort { |x, y|  x <=> y } }
      end


    end


  end # Práctica#11   ------   Valores nutricionales



end # RSpec.describe Individuo
