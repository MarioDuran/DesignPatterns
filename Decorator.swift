import Foundation

// Vas a crear un sistema que permita personalizar autos añadiendo características adicionales de manera dinámica.
// El sistema debe calcular el costo total y generar una descripción del auto según las modificaciones seleccionadas.
// Usarás el patrón Decorator para agregar características como pintura metálica, sistema de audio premium
// y rines de lujo a un auto base.

// Requisitos:
//
// - Debe haber una clase base abstracta Auto con los métodos costo() y descripcion().
// - Implementar una clase concreta AutoBase que represente un auto básico.
// - Crear al menos tres decoradores concretos:
//   1. PinturaMetalica: Añade $1500 al costo y ", pintura metálica" a la descripción.
//   2. AudioPremium: Añade $2000 al costo y ", sistema de audio premium" a la descripción.
//   3. RinesLujo: Añade $1200 al costo y ", rines de lujo" a la descripción.
// - Los decoradores deben poder combinarse en cualquier orden.
// - En el programa principal, mostrar al menos tres ejemplos:
//   * Un auto base sin modificaciones.
//   * Un auto con pintura metálica y rines de lujo.
//   * Un auto con todas las modificaciones.

// Componente base
class Auto {
}

// Componente concreto
class AutoBase: Auto {
}

// Decorador base
class DecoradorAuto: Auto {
    var auto: Auto

    init(auto: Auto) {
        self.auto = auto
    }

    override func costo() -> Double {
        return auto.costo()
    }

    override func descripcion() -> String {
        return auto.descripcion()
    }
}

// TODO - Decoradores concretos
class PinturaMetalica: DecoradorAuto {
    override func costo() -> Double {
    }

    override func descripcion() -> String {
    }
}

class AudioPremium: DecoradorAuto {
    override func costo() -> Double {
    }

    override func descripcion() -> String {
    }
}

class RinesLujo: DecoradorAuto {
    override func costo() -> Double {
    }

    override func descripcion() -> String {
    }
}

// Auto base
let auto = AutoBase()
print("\(auto.descripcion()) - $\(auto.costo())")

// TODO - Auto con pintura metálica y rines de lujo
let autoPinturaRines = RinesLujo(auto: PinturaMetalica(auto: AutoBase()))
print("\(autoPinturaRines.descripcion()) - $\(autoPinturaRines.costo())")

// TODO - Auto con todas las modificaciones
let autoFull = AudioPremium(auto: RinesLujo(auto: PinturaMetalica(auto: AutoBase())))
print("\(autoFull.descripcion()) - $\(autoFull.costo())")
