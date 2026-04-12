import Foundation

// Descripción
//
// En un pequeño juego de estrategia, los personajes tienen diferentes clases
// como Arquero, Guerrero, etc., con atributos y equipo específico.
//
// Para poblar el mundo rápidamente, los desarrolladores quieren evitar crear
// cada personaje desde cero y prefieren clonar prototipos existentes.
//
// Para lograrlo, usarán el patrón de diseño Prototype, el cual permite crear
// nuevos objetos copiando una instancia ya configurada, en lugar de instanciar
// una nueva desde cero.
//
// Ejercicio
//
// Implementa el patrón Prototype en Swift para simular la clonación de
// personajes en un juego.
//
// Tu solución debe cumplir con lo siguiente:
//
// 1. Define un protocolo PersonajePrototype que tenga un método
//    clone(deep: Bool) -> PersonajePrototype.
// 2. Implementa el método clone() creando una copia superficial o profunda
//    dependiendo del parámetro deep.

// Clase auxiliar para evidenciar la diferencia entre shallow copy y deep copy
class Flechas: CustomStringConvertible {
    var normales: Int
    var fuego: Int

    init(normales: Int, fuego: Int) {
        self.normales = normales
        self.fuego = fuego
    }

    func clone() -> Flechas {
        return Flechas(normales: normales, fuego: fuego)
    }

    var description: String {
        return "{normales: \(normales), fuego: \(fuego)}"
    }
}

// TODO: Definir protocolo PersonajePrototype con métodos clone y mostrar
protocol PersonajePrototype {
}

class Arquero: PersonajePrototype {
    var vida: Int
    var arco: String
    var flechas: Flechas

    init(vida: Int, arco: String, flechas: Flechas) {
        self.vida = vida
        self.arco = arco
        self.flechas = flechas
    }

    func clone(deep: Bool = true) -> PersonajePrototype {
        // TODO: Implementa clone
    }

    func mostrar() {
        print("Arquero - Vida: \(vida), Arco: \(arco), Flechas: \(flechas)")
    }
}

class Guerrero: PersonajePrototype {
    var vida: Int
    var espada: String
    var escudo: String

    init(vida: Int, espada: String, escudo: String) {
        self.vida = vida
        self.espada = espada
        self.escudo = escudo
    }

    func clone(deep: Bool = true) -> PersonajePrototype {
        // TODO: Implementa clone
    }

    func mostrar() {
        print("Guerrero - Vida: \(vida), Espada: \(espada), Escudo: \(escudo)")
    }
}

class GeneradorDePersonajes {
    private let prototipo: PersonajePrototype

    init(_ prototipo: PersonajePrototype) {
        self.prototipo = prototipo
    }

    func generarPersonaje(deep: Bool = true) -> PersonajePrototype {
        return prototipo.clone(deep: deep)
    }
}

let prototipoArquero = Arquero(
    vida: 80,
    arco: "Arco Largo",
    flechas: Flechas(normales: 10, fuego: 5)
)

let prototipoGuerrero = Guerrero(
    vida: 120,
    espada: "Espada de Hierro",
    escudo: "Escudo de Madera"
)

let generadorArquero = GeneradorDePersonajes(prototipoArquero)
let generadorGuerrero = GeneradorDePersonajes(prototipoGuerrero)

let clonesArqueroShallow = (0..<2).map { _ in
    generadorArquero.generarPersonaje(deep: false)
}

let clonesArqueroDeep = (0..<2).map { _ in
    generadorArquero.generarPersonaje(deep: true)
}

let clonGuerrero = generadorGuerrero.generarPersonaje()

print("Clones Shallow antes de modificar:")
for (index, arquero) in clonesArqueroShallow.enumerated() {
    print("Shallow \(index + 1): ", terminator: "")
    arquero.mostrar()
}

print("\nModificando flechas del primer clon shallow...")
if let primerArquero = clonesArqueroShallow[0] as? Arquero {
    primerArquero.flechas.fuego = 99
}

print("\nClones Shallow después de modificar:")
for (index, arquero) in clonesArqueroShallow.enumerated() {
    print("Shallow \(index + 1): ", terminator: "")
    arquero.mostrar()
}

print("\nClones Deep (no deben verse afectados):")
for (index, arquero) in clonesArqueroDeep.enumerated() {
    print("Deep \(index + 1): ", terminator: "")
    arquero.mostrar()
}

print("\nEjemplo de clon de guerrero:")
clonGuerrero.mostrar()
