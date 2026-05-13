import Foundation

protocol EstadoSemaforo {
    func manejar(contexto: Semaforo)
}

final class EstadoRojo: EstadoSemaforo {
    func manejar(contexto: Semaforo) {
        print("El semáforo está en ROJO. Detenerse.")
        contexto.estado = EstadoVerde()
    }
}

final class EstadoVerde: EstadoSemaforo {
    func manejar(contexto: Semaforo) {
        print("El semáforo está en VERDE. Puede avanzar.")
        contexto.estado = EstadoAmarillo()
    }
}

final class EstadoAmarillo: EstadoSemaforo {
    func manejar(contexto: Semaforo) {
        print("El semáforo está en AMARILLO. Reducir la velocidad.")
        contexto.estado = EstadoRojo()
    }
}

final class Semaforo {
    var estado: EstadoSemaforo

    init() {
        self.estado = EstadoRojo()
    }

    func cambiar() {
        estado.manejar(contexto: self)
    }
}

let semaforo = Semaforo()

semaforo.cambiar()
semaforo.cambiar()
semaforo.cambiar()
semaforo.cambiar()
