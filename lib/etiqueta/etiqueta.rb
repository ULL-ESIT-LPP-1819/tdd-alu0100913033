# @author Tomás González Martín
module Etiqueta
  include Enumerable

  # @author Tomás González Martín
  class Etiqueta
    include Comparable
    attr_reader :nombre, :cantidad, :grasas, :grasas_sat, :grasas_mono, :grasas_poli, :polialcoholes, :almidon, :fibra, :vitaminas, :minerales, :hidratos, :azucares, :proteinas, :sal

    # Inicialización de la clase Etiqueta del módulo Etiqueta
    # @param nombre [String] nombre de la etiqueta
    # @param cantidad [Float] cantidad total del producto en gr
    # @param grasas [Float] cantidad de grasa en gr
    # @param grasas_sat [Float] cantidad de grasas saturadas en gr
    # @param grasas_mono [Float] cantidad de grasas monoinsaturadas en gr
    # @param grasas_poli [Float] cantidad de grasas poliinsaturadas en gr
    # @param polialcoholes [Float] cantidad de polialcoholes en gr
    # @param almodon [Float] cantidad de almidón en gr
    # @param fibra [Float] cantidad de fibra en gr
    # @param vitaminas [Float] cantidad de vitaminas en mgr
    # @param minerales [Float] cantidad de minerales en mgr
    # @param hidratos [Float] cantidad de hidratos en gr
    # @param azucares [Float] cantidad de azúcares en gr
    # @param proteínas [Float] cantidad de proteínas en gr
    # @param sal [Float] cantidad de sal en gr
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


    # Mostrar la etiqueta de manera específica
    # @return [String] el resultado ordenado
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

    # Método para obtener el % de los valores
    # @param value [Float] valor a utilizar
    # @return [Float] la representación de ese valor sobre el producto total
    def cien(value)
      (value * 100) / @cantidad
    end

    # Obtención del valor energético en kJ
    # @return [Float] valor energético del producto en kJ
    def valor_energetico_kj
      @grasas*37 + (@hidratos + @proteinas)*17
    end

    # Obtención del valor energético en kcal
    # @return [Float] valor energético del producto en kcal
    def valor_energetico_kcal
      @grasas*9 + (@hidratos + @proteinas)*4
    end

    # Obtención del IR
    # @return [Float] IR
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

    # Función de Comparable para poder comparar objetos entre sí
    # @return [Float] comparación entre dos objetos de la clase Etiqueta
    def <=>(other)
      return nil unless other.instance_of? Etiqueta
      self.valor_energetico_kj <=> other.valor_energetico_kj
    end

  end


##############################################################################
###################### LPP - Práctica #7 - POO ###############################
##############################################################################

  # @author Tomás González Martín
  Node = Struct.new(:value, :next, :prev) do
    #######################################
    ######### Inserciones varias ##########
    #######################################
    # Método de inserción por la cabeza de la dll
    # @param value [?] valor de tipo no definido a insertar en la cabeza de la dll
    def insert_head(value)
      next_node = Node.new(value, nil, self.gethead)
      self.gethead.next = next_node
    end

    # Método de inserción por la cola de la dll
    # @param value [Object] valor de tipo no definido a insertar en la cola de la dll
    def insert_tail(value)
      prev_node = Node.new(value, self.gettail, nil)
      self.gettail.prev = prev_node
    end

    #######################################
    ############## Capar DDL## ############
    #######################################
    # Método de eliminación de la cabeza de la dll
    def remove_head
      self.next = nil
    end

    # Método de eliminación de la cabeza de la dll
    def remove_tail
      self.prev = nil
    end

    #######################################
    ######### Obtener TAIL y HEAD #########
    #######################################
    # Método de obtención del nodo que está presente en la cola
    # @return [Object] valor presente en la cola
    def gettail
      if self.prev == nil
        self
      else
        self.prev.gettail
      end
    end

    # Método de obtención del nodo que está presente en la cabeza
    # @return [Object] valor presente en la cabeza
    def gethead
      if self.next == nil
        self
      else
        self.next.gethead
      end
    end

    #######################################
    ########### Mostrar el DLL ############
    #######################################
    # Mostrar toda la lista doblemente enlazada
    # Pasa la tarea de muestreo al primer nodo de la cola
    def to_s
      @@out = Array.new(0)
      if (self == self.gethead)
        self.display
      else
        self.gethead.display
      end
    end

    # Función auxiliar al to_s, que muestra la cola de manera ordenada
    # @return @@out [Objeto] concatena los diferentes valores a mostrar
    def display
      @@out.insert(0, self.value)
      if self.prev != nil
        self.prev.display
      end

      @@out

    end




    #######################################
    ####### Mostrar el DLL al revés #######
    #######################################
    # Comprueba si la lista está o no vacía
    # @return [Bool] verdadero si está vacía, falso si no
    def empty?
      if self.value == nil
        true
      else
        false
      end
    end

    def each
      for i in self.to_s do
        yield i
      end
    end


    # Obtención del tamaño total de la DLL
    # Usa función auxiliar "getting_size" para su cometido
    def get_size
      @@size = 0
      if self == self.gettail
        self.getting_size
      else
        self.gettail.get_size
      end
    end

    # Función auxiliar para la obtención del tamaño total de la DLL
    # @return [Interger] devuelve el tamaño total de la DLL
    def getting_size
      @@size += 1
      if self.next == nil
        return @@size
      else
        self.next.getting_size
      end
    end


  end





end # fin de module
