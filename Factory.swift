import Foundation

// Problema: Fábrica de Procesadores de Pago
//
// Una plataforma de comercio electrónico necesita integrar distintos métodos
// de pago sin que el código cliente dependa de clases concretas.
//
// Los tipos de procesadores que se manejarán son:
//
// - Credit Card
// - PayPal
// - Bank Transfer
//
// Cada procesador debe poder:
// - validar un pago
// - procesar un pago
//
// El objetivo es aplicar el patrón Factory Method para que el cliente pueda
// solicitar un procesador específico sin conocer los detalles de su creación.


// Ejercicio:
//
// 1. Crear una interfaz o protocolo PaymentProcessor que defina los métodos:
//    - validatePayment(amount:)
//    - processPayment(amount:)
//
// 2. Diseñar una clase base PaymentProcessorCreator con un método
//    Factory Method llamado createProcessor().
//
// 3. Implementar clases concretas de procesadores:
//    - CreditCardProcessor
//    - PayPalProcessor
//    - BankTransferProcessor
//
// 4. Implementar clases concretas creadoras:
//    - CreditCardProcessorCreator
//    - PayPalProcessorCreator
//    - BankTransferProcessorCreator
//

// MARK: - Interfaz base para procesadores de pago

// TODO: Define the common interface for all payment processors
protocol PaymentProcessor {
}


// TODO: Implementaciones concretas
final class CreditCardProcessor: PaymentProcessor {
}

final class PayPalProcessor: PaymentProcessor {
}

final class BankTransferProcessor: PaymentProcessor {
}

// TODO: Define la clase base con el método de la fábrica 
class PaymentProcessorCreator {
}


// TODO: - Creadores concretos
final class CreditCardProcessorCreator: PaymentProcessorCreator {
}

final class PayPalProcessorCreator: PaymentProcessorCreator {
}

final class BankTransferProcessorCreator: PaymentProcessorCreator {
}

// Create a client function that uses the factory method
func handlePayment(with creator: PaymentProcessorCreator, amount: Double) {
    let processor = creator.createProcessor()

    if processor.validatePayment(amount: amount) {
        print(processor.processPayment(amount: amount))
    } else {
        print("Payment validation failed for amount: $\(String(format: "%.2f", amount))")
    }
}

let creditCardCreator = CreditCardProcessorCreator()
let payPalCreator = PayPalProcessorCreator()
let bankTransferCreator = BankTransferProcessorCreator()

handlePayment(with: creditCardCreator, amount: 1200)
handlePayment(with: payPalCreator, amount: 8500)
handlePayment(with: bankTransferCreator, amount: 20)
handlePayment(with: bankTransferCreator, amount: 300)
