// Problema, Adaptar sistemas de pagos
//
// Se está desarrollando una aplicación de comercio electrónico. El sistema ya cuenta con una interfaz PaymentProcessor que es utilizada por todas las partes del sistema para procesar pagos.
//
// El equipo ha decidido integrar un nuevo proveedor de pagos llamado FastPayAPI. Sin embargo, este proveedor expone una interfaz diferente a la esperada por el sistema actual.
//
// Requisitos
//
// Implementar un adaptador que permita utilizar FastPayAPI como si fuera un PaymentProcessor, sin modificar el resto del sistema.
//
// Beneficios
//
// Evita la modificación del código existente.
// Facilita el mantenimiento y futuras integraciones de otros proveedores.
// Promueve la separación de responsabilidades.

protocol PaymentProcessor {
    func pay(amount: Double)
}

class StripeProcessor: PaymentProcessor {
    func pay(amount: Double) {
        print("Procesando pago de $\(amount) con Stripe...")
    }
}

func checkout(processor: PaymentProcessor) {
    processor.pay(amount: 49.99)
}

class FastPayAPI {
    func makePayment(value: Double, currency: String) -> String {
        print("Realizando pago de \(value) \(currency) con FastPay...")
        return "Pago exitoso"
    }
}

// TODO: Implementar adaptador para usar FastPayAPI como PaymentProcessor
class FastPayAdapter: PaymentProcessor {
}

let stripe = StripeProcessor()
checkout(processor: stripe)

let fastPay = FastPayAPI()
let adapter = FastPayAdapter(fastPay)
checkout(processor: adapter)
