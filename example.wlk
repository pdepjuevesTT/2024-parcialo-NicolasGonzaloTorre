class MetodoDePago {
    var nombre

    method initialize(nombre) {
        this.nombre = nombre
    }

    method puedePagar(precio) {
        throw new Error("Debe implementarse en la subclase.")
    }

    method pagar(precio) {
        throw new Error("Debe implementarse en la subclase.")
    }

    method resetearBalance(salario) {
        throw new Error("Debe implementarse en la subclase.")
    }
}
class Efectivo inherits MetodoDePago {
    var saldo

    method initialize(nombre, saldoInicial) {
        super.initialize(nombre)
        saldo = saldoInicial
    }

    method puedePagar(precio) {
        return saldo >= precio
    }

    method pagar(precio) {
        if (!this.puedePagar(precio)) {
            throw new Error("Saldo insuficiente en efectivo.")
        }
        saldo -= precio
        print("Pago realizado con efectivo. Saldo restante: $" + saldo)
    }

    method resetearBalance(salario) {
        saldo += salario
        print("Nuevo saldo en efectivo: $" + saldo)
    }
}
class Debito inherits MetodoDePago {
    var saldo

    method initialize(nombre, saldoInicial) {
        super.initialize(nombre)
        saldo = saldoInicial
    }

    method puedePagar(precio) {
        return saldo >= precio
    }

    method pagar(precio) {
        if (!this.puedePagar(precio)) {
            throw new Error("Saldo insuficiente en débito.")
        }
        saldo -= precio
        print("Pago realizado con débito. Saldo restante: $" + saldo)
    }

    method resetearBalance(salario) {
        saldo += salario
        print("Nuevo saldo en débito: $" + saldo)
    }
}
class Credito inherits MetodoDePago {
    var deuda
    var limite

    method initialize(nombre, limite) {
        super.initialize(nombre)
        deuda = 0
        this.limite = limite
    }

    method puedePagar(precio) {
        return (deuda + precio) <= limite
    }

    method pagar(precio) {
        if (!this.puedePagar(precio)) {
            throw new Error("Límite de crédito excedido.")
        }
        deuda += precio
        print("Pago realizado con crédito. Deuda actual: $" + deuda)
    }

    method resetearBalance(salario) {
        const pago = Math.min(deuda, salario)
        deuda -= pago
        print("Deuda reducida a: $" + deuda + " después de recibir salario.")
    }
}
class Persona {
    var nombre
    var salario
    var metodoDePagoPreferido
    var metodosDePago

    method initialize(nombre, salario) {
        this.nombre = nombre
        this.salario = salario
        this.metodoDePagoPreferido = null
        this.metodosDePago = []
    }

    method agregarMetodoDePago(metodoDePago) {
        metodosDePago.add(metodoDePago)
    }

    method establecerMetodoDePagoPreferido(metodoDePago) {
        if (!metodosDePago.includes(metodoDePago)) {
            throw new Error("El método de pago no está registrado.")
        }
        metodoDePagoPreferido = metodoDePago
    }

    method obtenerMetodoDePago(nombreMetodo) {
        return metodosDePago.find(m => m.nombre == nombreMetodo) or 
               throw new Error("Método de pago no encontrado.")
    }

    method comprar(item, precio) {
        const metodo = this.obtenerMetodoDePago(metodoDePagoPreferido)
        if (!metodo.puedePagar(precio)) {
            throw new Error("Fondos insuficientes con el método preferido.")
        }
        metodo.pagar(precio)
        print("Compra exitosa de: " + item + " por $" + precio)
    }

    method cicloMensual() {
        print("Distribuyendo salario: $" + salario)
        metodosDePago.forEach(m => m.resetearBalance(salario))
    }
}
CASOS DE USO
const persona = new Persona("Juan", 20000)

const efectivo = new Efectivo("Efectivo", 5000)
const debito = new Debito("Débito", 10000)
const credito = new Credito("Crédito", 30000)

persona.agregarMetodoDePago(efectivo)
persona.agregarMetodoDePago(debito)
persona.agregarMetodoDePago(credito)

persona.establecerMetodoDePagoPreferido("Efectivo")

persona.comprar("Televisor", 4000) // Compra con efectivo
persona.comprar("Celular", 2000)   // Error: saldo insuficiente en efectivo

persona.establecerMetodoDePagoPreferido("Débito")
persona.comprar("Celular", 2000)   // Compra con débito

persona.cicloMensual() // Distribuye el salario entre los métodos
persona.establecerMetodoDePagoPreferido("Crédito")
persona.comprar("Laptop", 25000)  // Compra con crédito (si está dentro del límite)
