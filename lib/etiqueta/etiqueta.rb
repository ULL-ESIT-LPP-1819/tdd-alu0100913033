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
      @vitaminas = vitaminas/1000
      @minerales = minerales/1000
      @hidratos = hidratos
      @azucares = azucares
      @proteinas = proteinas
      @sal = sal
    end



    def to_s

      "                          ||  Por 100g o 100 ml  ||        IR         ||     Por       ||            IR
                          ||    de producto      || (por 100g 0 100ml ||    porción    || (por porción de #{@cantidad.round(2)}
                          ||                     ||    de producto)   ||    de #{@cantidad.round(2)}   ||     g de producto)
       __________________________________________________________________________________________________________
        Valor energético  ||#{sprintf('      %.2f kJ', cien(valor_energetico_kj)).ljust(21)}||#{sprintf('       %.2f %%', cien(ir_("julios"))).ljust(19)}||#{sprintf('   %.2f kJ', valor_energetico_kj).ljust(15)}||#{sprintf('         %.2f %%', ir_("julios")).ljust(21)}
                          ||#{sprintf('      %.2f kcal', cien(valor_energetico_kcal)).ljust(21)}||#{sprintf('       %.2f %%', cien(ir_("calorias"))).ljust(19)}||#{sprintf('   %.2f kcal', valor_energetico_kcal).ljust(15)}||#{sprintf('         %.2f %%', ir_("calorias")).ljust(21)}
       __________________________________________________________________________________________________________
        Grasas totales    ||#{sprintf('      %.2f g', cien(@grasas)).ljust(21)}||#{sprintf('       %.2f %%', cien(ir_("grasas"))).ljust(19)}||#{sprintf('   %.2f g', @grasas).ljust(15)}||#{sprintf('         %.2f %%', ir_("grasas")).ljust(21)}
              Saturadas ->||#{sprintf('      %.2f g', cien(@grasas_sat)).ljust(21)}||#{sprintf('       %.2f %%', cien(ir_("ácidos"))).ljust(19)}||#{sprintf('   %.2f g', @grasas_sat).ljust(15)}||#{sprintf('         %.2f %%', ir_("ácidos")).ljust(21)}
        Monoinsaturadas ->||#{sprintf('      %.2f g', cien(@grasas_mono)).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f g', @grasas_mono).ljust(15)}||#{sprintf('          -').ljust(21)}
        Poliinsaturadas ->||#{sprintf('      %.2f g', cien(@grasas_poli)).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f g', @grasas_poli).ljust(15)}||#{sprintf('          -').ljust(21)}
        __________________________________________________________________________________________________________
        Hidratos          ||#{sprintf('      %.2f g', cien(@hidratos)).ljust(21)}||#{sprintf('       %.2f %%', cien(ir_("hidratos"))).ljust(19)}||#{sprintf('   %.2f g', @hidratos).ljust(15)}||#{sprintf('         %.2f %%', ir_("hidratos")).ljust(21)}
               Azúcares ->||#{sprintf('      %.2f g', cien(@azucares)).ljust(21)}||#{sprintf('       %.2f %%', cien(ir_("azúcares"))).ljust(19)}||#{sprintf('   %.2f g', @azucares).ljust(15)}||#{sprintf('         %.2f %%', ir_("azúcares")).ljust(21)}
          Polialcoholes ->||#{sprintf('      %.2f g', cien(@polialcoholes)).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f g', @polialcoholes).ljust(15)}||#{sprintf('          -').ljust(21)}
                Almidón ->||#{sprintf('      %.2f g', cien(@almidon)).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f g', @almidon).ljust(15)}||#{sprintf('          -').ljust(21)}
        __________________________________________________________________________________________________________
        Fibra alimentaria ||#{sprintf('      %.2f g', cien(@fibra)).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f g', @fibra).ljust(15)}||#{sprintf('          -').ljust(21)}
        __________________________________________________________________________________________________________
        Proteínas         ||#{sprintf('      %.2f g', cien(@proteinas)).ljust(21)}||#{sprintf('       %.2f %%', cien(ir_("proteínas"))).ljust(19)}||#{sprintf('   %.2f g', @proteinas).ljust(15)}||#{sprintf('         %.2f %%', ir_("proteínas")).ljust(21)}
        __________________________________________________________________________________________________________
        Sal               ||#{sprintf('      %.2f g', cien(@sal)).ljust(21)}||#{sprintf('       %.2f %%', cien(ir_("sal"))).ljust(19)}||#{sprintf('   %.2f g', @sal).ljust(15)}||#{sprintf('         %.2f %%', ir_("sal")).ljust(21)}


                                                      VITAMINAS Y MINERALES
        __________________________________________________________________________________________________________
        Vitaminas         ||#{sprintf('      %.2f mg', (cien(@vitaminas))*1000).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f mg', @vitaminas * 1000).ljust(15)}||#{sprintf('          -').ljust(21)}
        minerales         ||#{sprintf('      %.2f mg', (cien(@minerales))*1000).ljust(21)}||#{sprintf('         - ').ljust(19)}||#{sprintf('   %.2f mg', @minerales * 1000).ljust(15)}||#{sprintf('          -').ljust(21)}


  "

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

      if valor == "ácidos"
        total = (@grasas_sat * 100 ) / 20
      end

      if valor == "hidratos"
        total = (@hidratos * 100 ) / 260
      end

      if valor == "azúcares"
        total = (@azucares * 100 ) / 90
      end

      if valor == "proteínas"
        total = (@proteinas * 100 ) / 50
      end

      if valor == "sal"
        total = (@sal * 100 ) / 6
      end

      total
    end

  end

  Node = Struct.new(:value, :next, :prev) do
    
  end

end
