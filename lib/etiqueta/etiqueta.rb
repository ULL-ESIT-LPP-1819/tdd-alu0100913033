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



    def valor_energetico_kj_cien
      cien(self.valor_energetico_kj)
    end

    def valor_energetico_kcal_cien
       cien(self.valor_energetico_kcal)
    end

    def ir_kj_cien
      self.valor_energetico_kj_cien / 8400
    end

    def ir_kcal_cien
      self.valor_energetico_kcal_cien / 2000
    end

    def valor_energetico_kj
      @grasas*37 + (@hidratos + @proteinas)*17
    end

    def valor_energetico_kcal
      @grasas*9 + (@hidratos + @proteinas)*4
    end

    def ir_kj
      self.valor_energetico_kj / 8400
    end

    def ir_kcal
      self.valor_energetico_kcal / 2000
    end

    def ir_(valor)
      if valor == "valor_energetico_kj"
        valor_energetico_kj / 8400
      end

    end




    def cien(value)
      (value * 100 ) / @cantidad
    end




  end

end
