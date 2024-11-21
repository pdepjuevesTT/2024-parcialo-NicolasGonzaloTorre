class Persona {
  const property formaDePago = []
  var formaPagoPreferida 
  var dineroDisponible
  const property compras = []
  var efectivo
  var property saldo
  const property meses = []
  var mesActual

  method pagarCuotaDelMes(){
    if(dineroDisponible >= meses.get(mesActual).cuotasApagar().first()){
      self.cobrar(self.cuotaSiguiente())
      meses.get(mesActual).//cuotaPaga(self.cuotaSiguiente()) 
      self.pagarCoutaDelMes
    }
    else(meses.get(mesActual).cuotasApagar().ad) ///(meses.get(mesActual + 1).cuotasApagar().size() > 0)
  }

  method cuotaSiguiente() {
    if(meses.get(mesActual + 1).cuotasApagar().size() > 0){
      meses.get(mesActual).cuotaSiguiente()
/////
    }
    
  }

  method pagar(cuota){
    dineroDisponible = dineroDisponible - Cuota
  }

  method gastar(monto){
    dineroDisponible = dineroDisponible - monto

  } 

  method actualizarSaldo(monto) {

    saldo = saldo * monto

  }

  method actualizarDinero(monto) {
    efectivo = efectivo - monto
  }

  method cambiarFormaDePago(formaDePag) {
    if(self.tieneFormaDePago(formaDePag)){
    formaPagoPreferida = formaDePag
    }
  }

  method hacerCompra(monto){
    formaPagoPreferida.utilizarMetodo(self, compras.costo())
  }

 method terminaMes() {
  mesActual += mesActual + 1
  self.cobrar()
  self.pagarCoutaDelMes()
}

 method cobrar() {
 dineroDisponible = dineroDisponible + saldo
 }

 method tieneFormaDePago(formaDePag) {
  formaDePago.contains(formaDePag)
 }
 method pagarCoutaDelMes(){
  formaPagoPreferida.pagar(self, self.compras.costo())
 }
}

class Compra{
  var costo
}

object efectivo {

  method utilizarMetodo(persona,monto) {
    if(persona.dineroDisponible()>= monto ){
      persona.gastar(monto)
    }
    else(self.error("dinero insuficiente"))
  }
}

class Debito{

var saldo

method actualizarSaldo(monto){
 saldo = saldo + monto
}

 method utilizarMetodo(persona,monto) {
    if(saldo >= monto ){
      self.actualizarSaldo(monto)
    }
    else(self.error("dinero insuficiente"))
  }
}

class Credito{
  const banco
  var coutaPorMes
  const property cuotas = []

  agregarCuotaParaPagar

  method utilizarMetodo(persona,monto) {
  if(banco.montoMax() >= monto){
    const precioDeCuota = self.precioDeCuota(monto)
    coutaPorMes = monto/banco.cantidadCuotas()
  }
  
  method agregarCuotaPagar(siguiente,couta){
    siguiente.cuotaApagar().add(cuotas)
  }
  
  }
}

class Mes{
  const property cuotaApagar = []
  //method pagarMes {
  
  
}

class banco{
  var montoMax
  var cantCuotas
  }

class Cuota{
  var CantCuotas
}
