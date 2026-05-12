import Foundation

/*
Ejercicio: Sistema de Control de Vuelos con Mediator Pattern

Descripción

Este ejercicio tiene como objetivo modelar un sistema de control de tráfico aéreo utilizando el patrón de diseño Mediator. En este sistema:

- Los aviones (colegas) no se comunican entre sí directamente.
- Una torre de control (mediador) centraliza toda la comunicación.
- La torre de control gestiona las solicitudes y notificaciones, garantizando orden y seguridad.

Requisitos de implementación

1. Crear una clase concreta ControlTower que:
   - Implemente la interfaz FlightMediator.
   - Administre la lista de vuelos registrados.
   - Notifique a todos los vuelos excepto al remitente.
   - Agregue un timestamp a cada mensaje.
*/

protocol FlightMediator: AnyObject {
    func sendMessage(_ message: String, from flight: AbstractFlight)
    func addFlight(_ flight: AbstractFlight)
}

class ControlTower: FlightMediator {
    private var flights: [AbstractFlight] = []

    func addFlight(_ flight: AbstractFlight) {
        // TODO: Administrar la lista de vuelos registrados.
    }

    func sendMessage(_ message: String, from flight: AbstractFlight) {
        // TODO: Notificar a todos los vuelos excepto al remitente.
    }

    func notifyFlights(_ message: String, sender: AbstractFlight) {
        // TODO: Agregar un timestamp a cada mensaje.
        // TODO: Notificar a todos los vuelos excepto al remitente.
    }
}

class AbstractFlight {
    let flightID: String
    weak var mediator: FlightMediator?

    init(flightID: String) {
        self.flightID = flightID
    }

    func setMediator(_ mediator: FlightMediator) {
        self.mediator = mediator
    }

    func send(_ message: String) {
        fatalError("Este método debe ser implementado por una subclase")
    }

    func receiveMessage(_ message: String) {
        fatalError("Este método debe ser implementado por una subclase")
    }
}

class Airplane: AbstractFlight {
    override func send(_ message: String) {
        if let mediator = mediator {
            mediator.sendMessage(message, from: self)
        }
    }

    override func receiveMessage(_ message: String) {
        print("\(flightID) recibió: \(message)")
    }
}
