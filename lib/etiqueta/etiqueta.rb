module Etiqueta
  class Etiqueta
    attr_reader :nombre, :v_energetico, :grasas, :grasas_sat, :grasas_mono, :grasas_poli, :polialcoholes, :almidon, :fibra, :vitaminas, :minerales, :hidratos, :azucares, :proteinas, :sal

    def initialize (nombre, v_energetico, grasas, grasas_sat, grasas_mono, grasas_poli, polialcoholes, almidon, fibra, vitaminas, minerales, hidratos, azucares, proteinas, sal)
      @nombre = nombre
      @v_energetico = v_energetico
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


  end

end
