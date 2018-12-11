require 'etiqueta.rb'

# @author Tomás González Martín
module Persona
  include Etiqueta

  # @author Tomás González Martín
  class Persona < Node
    attr_reader :nombre, :edad, :sexo, :tratamiento, :lista_alimentos

    # Inicialización de la clase Persona del módulo Persona
    # @param nombre [String] contiene el nombre de la persona
    # @param edad [Interger] edad del individuo
    # @param sexo [Interger] 0 implica mujer y 1 implica hombre
    # @param tratamiento [Interger] 0 implica "sin tratamiento", y 1 "en tratamiento"
    # @param lista_alimentos [Etiqueta::Node] contiene un listado de alimentos consumidos a lo largo del día por el individuo
    def initialize(nombre, edad, sexo, tratamiento, lista_alimentos = Etiqueta::Node)
      @nombre, @edad, @sexo = nombre, edad, sexo
      @tratamiento = tratamiento
      @lista_alimentos = lista_alimentos
    end

    # Mostrar a la persona
    # @return [String] descripción de la persona con el uso de los atributos
    def to_s
      if (@sexo == 1) # hombre
        "Soy #{@nombre}, hombre de #{@edad} años de edad"
      else
        "Soy #{@nombre}, mujer de #{@edad} años de edad"
      end
    end #ned to_s

  end # class Persona




  # @author Tomás González Martín
  class DatosAntropometricos < Persona
    include Comparable
    attr_reader :peso, :talla, :sexo, :cintura, :cadera

    # @param nombre [String] contiene el nombre de la persona
    # @param peso [Float] peso total de la persona en Kg
    # @param talla [Float] talla total de la persona en cm
    # @param edad [Interger] edad del individuo
    # @param sexo [Interger] 0 implica mujer y 1 implica hombre
    # @param cintura [Float] anchura de la cintura de la persona en cm
    # @param cadera [Float] anchura de la cadera de la persona en cm
    # @param tratamiento [Interger] 0 implica "sin tratamiento", y 1 "en tratamiento"
    # @param lista_alimentos [Etiqueta::Node] contiene un listado de alimentos consumidos a lo largo del día por el individuo
      def initialize(nombre, peso, talla, edad, sexo, cintura, cadera, tratamiento, lista_alimentos)
        # Comprobar que la lista de alimentos se recibe correctamente
        raise ArgumentError, 'La lista es incorrecta' unless lista_alimentos.is_a? Etiqueta::Node
        super(nombre, edad, sexo, tratamiento, lista_alimentos)
        @peso = peso
        @talla = talla
        @cintura = cintura
        @cadera = cadera
        @lista_alimentos = lista_alimentos
      end


      # Mostrar los datos Antropométricos de la persona
      # @return [String] datos de la persona
      def to_s
        resultado = "#{super} \n\n#{self.imc} \n#{self.rcc}"
        puts resultado
        if resultado == ""
          return "error!"
        else
          return ""
        end

      end

      # Obtención numérica del IMC del individuo
      # @return [Float] devuelve el IMC del individuo
      def get_imc
        @peso / ( @talla * @talla )
      end

      # Obtención descriptiva del IMC del individuo
      # @return [String] descripción del individuo en base a su IMC
      def imc
        imc_value = get_imc

          if imc_value < 18.5
            resultado = "Bajo peso  ->  Delgado"
          elsif imc_value >= 18.5 && imc_value <= 24.9
            resultado = "Adecuado   ->  Aceptable"
          elsif imc_value >= 25.0 && imc_value <= 29.9
            resultado = "Sobrepeso  ->  Sobrepeso"
          elsif imc_value >= 30.00 && imc_value <= 34.9
            resultado = "Obesidad grado 1 ->  Obesidad"
          elsif imc_value >= 35.00 && imc_value <= 39.9
            resultado = "Obesidad grado 2 ->  Obesidad"
          elsif imc_value >= 40
            resultado = "Obesidad grado 2 ->  Obesidad"
          end

          return resultado
      end

      # Calcular la cantidad total de grasa presente en la persona
      # @return grasa [Float] grasa total
      def grasa
        grasa = 1.2 * @peso / ( @talla * @talla ) + 0.23 * @edad - 10.8 * @sexo - 5.4
      end

      # Obtención numérica del RCC del individuo
      # @return [Float] devuelve el RCC del individuo
      def get_rcc
        @cintura / @cadera
      end

      # Obtención descriptiva del RCC del individuo
      # @return [String] descripción del individuo en base a su RCC
      def rcc
        rcc_value = get_rcc

        if @sexo == 0
            if rcc_value >= 0.83 && rcc_value <= 0.88
              resultado  = "rcc(bajo)=#{sprintf('%.2f',rcc_value)} "
            end
            if rcc_value > 0.88 && rcc_value <=0.95
              resultado  = "rcc(Moderado)=#{sprintf('%.2f',rcc_value)} "
            end
            if rcc_value >0.95 && rcc_value <=1.01
              resultado  = "rcc(Alto)=#{sprintf('%.2f',rcc_value)} "
            end
            if rcc_value > 1.01
              resultado  = "rcc(Muy Alto)=#{sprintf('%.2f',rcc_value)} "
            end
          end
        if @sexo == 1
          if rcc_value >= 0.72 && rcc_value <= 0.75
            resultado  = "rcc(bajo)=#{sprintf('%.2f',rcc_value)} "
          end
          if rcc_value > 0.78 && rcc_value <= 0.82
            resultado  = "rcc(Moderado)=#{sprintf('%.2f',rcc_value)} "
          end
          if rcc_value > 0.82
            resultado  = "rcc(Muy Alto)=#{sprintf('%.2f',rcc_value)} "
          end
        end

        resultado
      end

      # Función de Comparable para poder comparar objetos entre sí
      # @return [Float] comparación entre dos objetos de la clase DatosAntropometricos
      def <=>(other)
        return nil unless other.instance_of? DatosAntropometricos
        self.get_imc <=> other.get_imc
      end




  end # class DatosAntropometricos

  # @author Tomás González Martín
  class MenuDietetico

    # @param
    def initialize(nombre, datos_antropometricos, nivel_actividad)
      raise ArgumentError, 'Datos Antropométricos incorrectos' unless datos_antropometricos.is_a? DatosAntropometricos
      @nombre = datos_antropometricos
      @nivel_actividad = nivel_actividad
    end



  end # class MenuDietetico


end # module Persona
