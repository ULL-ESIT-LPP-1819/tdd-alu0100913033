module Etiqueta
  class Etiqueta
    attr_reader :v_energetico, :grasas, :grasas_sat, :hidratos, :azucares, :proteinas, :sal

    def initialize (v_energetico, grasas, grasas_sat, hidratos, azucares, proteinas, sal)
      @v_energetico = v_energetico
      @grasas = grasas
      @grasas_sat = grasas_sat
      @hidratos = hidratos
      @azucares = azucares
      @proteinas = proteinas
      @sal = sal
    end


  end

end
