require 'etiqueta.rb'
module Persona
  include Etiqueta

  class Persona < Node
    attr_reader :nombre, :edad, :sexo, :tratamiento, :lista_alimentos

    def initialize(nombre, edad, sexo, tratamiento, lista_alimentos = Etiqueta::Node)
      @nombre, @edad, @sexo = nombre, edad, sexo
      @tratamiento = tratamiento
      @lista_alimentos = lista_alimentos
    end

    def to_s
      if (@sexo == 1) # hombre
        "Soy #{@nombre}, hombre de #{@edad} años de edad"
      else
        "Soy #{@nombre}, mujer de #{@edad} años de edad"
      end
    end #ned to_s

  end # class Persona




  class DatosAntropometricos < Persona
    include Comparable
    attr_reader :peso, :talla, :sexo, :cintura, :cadera

      ##Constructor##
      def initialize(nombre, peso, talla, edad, sexo, cintura, cadera, tratamiento, lista_alimentos = Etiqueta::Node)
        super(nombre, edad, sexo, tratamiento, lista_alimentos)
        @peso = peso
        @talla = talla
        @cintura = cintura
        @cadera = cadera
      end



      def to_s
        resultado = "#{super} \n\n#{self.imc} \n#{self.rcc}"
        puts resultado
        if resultado == ""
          return "error!"
        else
          return ""
        end

      end

      def get_imc
        return @peso / ( @talla * @talla )
      end

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


      def grasa
        grasa = 1.2 * @peso / ( @talla * @talla ) + 0.23 * @edad - 10.8 * @sexo - 5.4
      end

      def get_rcc
        @cintura / @cadera
      end

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


      def <=>(other)
        #return nil unless other.instance_of? Persona
        self.get_imc <=> other.get_imc
      end




  end # class DatosAntropometricos



end # module Persona
