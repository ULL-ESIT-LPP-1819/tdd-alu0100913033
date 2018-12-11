require 'spec_helper'
require 'etiqueta/individuo'

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
      # expect(Persona::DatosAntropometricos.ancestors).to eq([Persona::DatosAntropometricos, Persona::Persona, Etiqueta::Node, Struct, Enumerable, Object, PP::ObjectMixin, Kernel, BasicObject])
      expect(Persona::DatosAntropometricos.superclass).to eq(Persona::Persona)
      expect(Persona::Persona.superclass).to eq(Etiqueta::Node)
    end
  end # Comprobar clase, tipo y jerarquía

  context "# Lista de cinco individuos" do
    before :all do
      @Datos_Jose = @Datos
      @Nodo = Etiqueta::Node.new(@Datos_Jose, nil, nil)
      @Datos_Camilo = Persona::DatosAntropometricos.new("Camilo", 87, 1.71, 32, 1, 90.2, 93.1, 1, @node)
      @Datos_Ana = Persona::DatosAntropometricos.new("Ana", 52, 1.71, 19, 0, 50.2, 60.2, 0, @node)
      @Datos_Fatima = Persona::DatosAntropometricos.new("Fátima", 57, 1.67, 26, 0, 54.2, 66.3, 0, @node)
      @Datos_Pedro = Persona::DatosAntropometricos.new("Pedro", 77, 1.77, 28, 1, 69.3, 70.1, 1, @node)
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
      @Datos_Camilo = Persona::DatosAntropometricos.new("Camilo", 87, 1.71, 32, 1, 90.2, 93.1, 1, @node)
      @Datos_Ana = Persona::DatosAntropometricos.new("Ana", 52, 1.71, 19, 0, 50.2, 60.2, 0, @node)
      @Datos_Fatima = Persona::DatosAntropometricos.new("Fátima", 57, 1.67, 26, 0, 54.2, 66.3, 0, @node)
      @Datos_Pedro = Persona::DatosAntropometricos.new("Pedro", 77, 1.77, 28, 1, 69.3, 70.1, 1, @node)
      @Datos_Nina = Persona::DatosAntropometricos.new("Nina", 52, 1.71, 92, 0, 50.2, 60.2, 0, @node)
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

    before :each do
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

    # Personas que han seguido esta dieta (hombre y mujer)
    @Datos_Camilo = Persona::DatosAntropometricos.new("Camilo", 87, 1.71, 32, 1, 90.2, 93.1, 1, @Nodo)
    @Datos_Ana = Persona::DatosAntropometricos.new("Ana", 52, 1.68, 19, 0, 50.2, 60.2, 0, @Nodo)

    # Seguimiento del menú sobre Ana y Camilo
    @Menu_Camilo = Persona::MenuDietetico.new(@Datos_Camilo, "Actividad moderada")
    @Menu_Ana = Persona::MenuDietetico.new(@Datos_Ana, "Reposo")
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

    end # Pruebas relativas a la clase

  end # Práctica #10

end # RSpec.describe Individuo
