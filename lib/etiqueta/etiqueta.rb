module Etiqueta
  class Etiqueta
    attr_reader :nombre, :cantidad, :grasas, :grasas_sat, :grasas_mono, :grasas_poli, :polialcoholes, :almidon, :fibra, :vitaminas, :minerales, :hidratos, :azucares, :proteinas, :sal

    def initialize (nombre, cantidad, grasas, grasas_sat, grasas_mono, grasas_poli, polialcoholes, almidon, fibra, vitaminas, minerales, hidratos, azucares, proteinas, sal)
      @cantidad = cantidad
      @nombre = nombre
      @grasas = grasas
      @grasas_sat = grasas_sat
      @grasas_mono = grasas_mono
      @grasas_poli = grasas_poli
      @polialcoholes = polialcoholes
      @almidon = almidon
      @fibra = fibra
      @vitaminas = vitaminas
      @minerales = minerales
      @hidratos = hidratos
      @azucares = azucares
      @proteinas = proteinas
      @sal = sal
    end

    def cien(value)
      (value * 100) / @cantidad
    end



    def valor_energetico_kj
      @grasas*37 + (@hidratos + @proteinas)*17
    end

    def valor_energetico_kcal
      @grasas*9 + (@hidratos + @proteinas)*4
    end


    def ir_(valor)
      total = 0.0
      if valor == "julios"
        total = (self.valor_energetico_kj * 100) / 8400
      end

      if valor == "calorias"
        total = (self.valor_energetico_kcal * 100) / 2000
      end

      if valor == "grasas"
        total = (@grasas * 100 ) / 70
      end
      total
    end









  end

end
