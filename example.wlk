class Persona{
  var property metodosDePago  
  var property cosas 
  var property formaDePagoPreferida
  var property trabajo  


  method tarjetasDeCreditos() = metodosDePago.filter({metodo => !metodo.debitoInstantaneo()})

  method totalMes() = self.deudasDelMes().sum()

  method dineroEnEfectivo() = metodosDePago.find({metodo => metodo.efectivo()}).dineroDisponible()

  method deudasDelMes() = self.tarjetasDeCreditos().map({tarjeta => tarjeta.deudaTotalPorMes()}) 

  method comprarUnObjeto(objeto) {
      cosas.add(objeto)
      formaDePagoPreferida.efectuarCompraPor(objeto.valor()) 
  }

  method cobrarSueldo(){
    const remanante = trabajo.sueldoActual() - self.totalMes(
        self.tarjetasDeCreditos().forEach({tarjeta => tarjeta.pagarDeudaDelMes()})
        self.agregarEfectivo(remanante)}
    else self.pagarLasQuePuede(trabajo.sueldo
  } 

  method puedeComprarConMetodoPreferido(objeto) = objeto.valor() <= formaDePagoPreferida.dineroDisponible()

  method pagarLasQuePuede(unDinero) {
      self.tarjetasDeCreditos().filter({tarjeta => tarjeta.deudaTotalPorMes() < unDinero}).forEach({tarjeta => tarjeta.pagarDeudasDelMes()})
  } 

  method agregarEfectivo(unValor){ metodosDePago.find({metodo =>


  method cantidadDeObjetosQueTiene() = self.cosas().size() 

  method formaDePagoPreferida(nuevaForma) {
    if(metodosDePago.contains(nuevaForma)) 
      formaDePagoPreferida = nuevaForma
    else 
      throw new DomainException(message ="no es posible")
  }
} 



object fecha {
  var property mes = 0

  method transcurreUnMes(
    
  }
  
}

class Efectivo {
  var property dineroDisponible 
  var property debitoInst
  var property efectivo = true
  

  method efectuarCompraPor(unValor) {
    dineroDisponible =- unValor
    
  }

  method recibirDineroPor(unValor) {
    dineroDisponible =+ unValor
    
  }

  method disminuirDineroPor(unValor) {
    dineroDisponible =- unValor 
    
  }

}

class TarjetaCredito {
  var property dineroDisponible 
  var property cantidadCuotas 
  var property interesMensual 
  var property debitoInstantaneo = false 
  var property efectivo = false
  var property deudaTotalDeTarjeta  

  method deudaTotalPorMes() = deudaTocantidadCuotas 

  method efectuarCompraPor(unValor) {
    if(dineroDisponible > unValor){
    deudaTotalDeTarjeta =+ unValor * interesMensual
    dineroDisponible =- unValor}

    else throw new DomainException(message ="no es posible")
  }
  method pagarDeudasDelMes() {
    deudaTotalDeTarjetself.deudaTotalPorMes()
    
  }


  
}

class Debito {
  var property dineroDisponible 
  var property debitoInstantaneo = true 
  var property titualaresDeLaCuenta 
  var property efectivo = false


  method efectuarCompraPor(unValor) {
    dineroDisponible =- unValor
  }

  
}

class Trabajo{
  var property sueldoActual

  method aumentoDeSueldo(porcentaje) = 
  if(porcentaje > 1)
  sueldoAct
  else 
    throw DomainException(message = "no es posible")

}

class Objeto{
  var property valor

}

class CompradoresCompulsivos inherits Persona{

  override method comprarUnObjeto(objeto) {
    super(objeto)
    metodosDePago.find({metodo => metodo.dineroDisponible() > objeto.valor()}).efectuarCompraPor(objeto.valor())
    }

}

class PagadoresCompulsivos inherits Persona{


  override method cobrarSueldo() {
    super()
    const cantidadDeEfectivo =   metodosDePago.find({metodo => metodo.efectivo()}).dineroDisponible()
    const remanante = trabajo.sueldoActual() - self.totalMes()
    const diferencia = cantidadDeEfectivo - remanante

    if(diferencia > 0 ) 
      self.tarjetasDeCreditos().forEach({tarjeta => tarjeta.pagarDeudaDelMes()})
      self.agregarEfectivo(-diferencia)
   }
}
