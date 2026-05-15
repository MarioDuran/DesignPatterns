/*
El patrón Command permite encapsular solicitudes como objetos, lo que posibilita parametrizar emisores con diferentes peticiones.

En este ejercicio se modelará un control remoto capaz de controlar distintos dispositivos, como lámparas o ventiladores, mediante comandos encapsulados.

Requerimientos:

Implemente el patrón Command para un sistema de control remoto.

El control remoto debe ser capaz de:
- Asignar comandos a botones.
- Ejecutar comandos dinámicamente.
- Controlar distintos dispositivos sin modificar el código interno del control remoto.

El objetivo principal es agregar la funcionalidad de encender y apagar el ventilador, crear los comandos correspondientes, y mapearlos al control remoto.

El sistema debe ser fácilmente extensible para incluir nuevos dispositivos o comandos sin modificar el código existente del control remoto.
*/

protocol Command {
    func execute()
}

class Lampara {
    func encender() {
        print("Lámpara encendida")
    }

    func apagar() {
        print("Lámpara apagada")
    }
}

class Ventilador {
    private var velocidad: Int = 0
    private var encendido: Bool = false

    // TODO: Implementar método encender.
    // Debe encender el ventilador y establecer la velocidad inicial en 1.
    func encender() {
        
    }

    // TODO: Implementar método apagar.
    // Debe apagar el ventilador y establecer la velocidad en 0.
    func apagar() {
        
    }

    func aumentarVelocidad() {
        if encendido {
            if velocidad < 3 {
                velocidad += 1
            } else {
                velocidad = 1
            }

            print("Velocidad del ventilador: \(velocidad)")
        } else {
            print("El ventilador está apagado. No se puede aumentar la velocidad.")
        }
    }
}

class EncenderLamparaCommand: Command {
    private let lampara: Lampara

    init(lampara: Lampara) {
        self.lampara = lampara
    }

    func execute() {
        lampara.encender()
    }
}

class ApagarLamparaCommand: Command {
    private let lampara: Lampara

    init(lampara: Lampara) {
        self.lampara = lampara
    }

    func execute() {
        lampara.apagar()
    }
}

class AumentarVelocidadVentiladorCommand: Command {
    private let ventilador: Ventilador

    init(ventilador: Ventilador) {
        self.ventilador = ventilador
    }

    func execute() {
        ventilador.aumentarVelocidad()
    }
}

// TODO: Implementar comando EncenderVentiladorCommand.
// Debe recibir un Ventilador en el inicializador y ejecutar su método encender.


// TODO: Implementar comando ApagarVentiladorCommand.
// Debe recibir un Ventilador en el inicializador y ejecutar su método apagar.


class ControlRemoto {
    private var botones: [String: Command] = [:]

    func asignarComando(nombreBoton: String, comando: Command) {
        botones[nombreBoton] = comando
    }

    func presionarBoton(nombreBoton: String) {
        if let comando = botones[nombreBoton] {
            comando.execute()
        } else {
            print("No hay comando asignado al botón \(nombreBoton)")
        }
    }
}

let lampara = Lampara()
let ventilador = Ventilador()

let controlRemoto = ControlRemoto()

let encenderLampara = EncenderLamparaCommand(lampara: lampara)
let apagarLampara = ApagarLamparaCommand(lampara: lampara)
let aumentarVelocidadVentilador = AumentarVelocidadVentiladorCommand(ventilador: ventilador)

// TODO: Crear instancia del comando para encender el ventilador.


// TODO: Crear instancia del comando para apagar el ventilador.


controlRemoto.asignarComando(nombreBoton: "A", comando: encenderLampara)
controlRemoto.asignarComando(nombreBoton: "B", comando: apagarLampara)
controlRemoto.asignarComando(nombreBoton: "C", comando: aumentarVelocidadVentilador)

// TODO: Asignar el comando de encender ventilador a un botón.


// TODO: Asignar el comando de apagar ventilador a un botón.


controlRemoto.presionarBoton(nombreBoton: "A")
controlRemoto.presionarBoton(nombreBoton: "B")

// TODO: Probar encender el ventilador.


// TODO: Probar aumentar la velocidad del ventilador.


// TODO: Probar apagar el ventilador.
