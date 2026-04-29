/*
Ejercicio: Robot con Patrón Strategy

Cada robot puede equiparse con diferentes tipos de armas, por ejemplo:
cañón de plasma, lanzallamas o rayo electromagnético.

El tipo de ataque debe ser intercambiable en tiempo de ejecución.

Requisitos:

- Implementa al menos tres clases concretas que hereden de WeaponStrategy:
  PlasmaCannon, Flamethrower y ElectroRay.

- Cada clase debe tener su propio método attack() que devuelva un mensaje descriptivo.

- Completa el código del objeto Robot para asignarle diferentes armas.
*/

import Foundation

protocol WeaponStrategy {
    func attack() -> String
}

// TODO PlasmaCannon

// TODO Flamethrower

// TODO ElectroRay

class Robot {
    private var weaponStrategy: WeaponStrategy

    init(weaponStrategy: WeaponStrategy) {
        self.weaponStrategy = weaponStrategy
    }

    func setWeaponStrategy(_ weaponStrategy: WeaponStrategy) {
        self.weaponStrategy = weaponStrategy
    }

    func fight() -> String {
        return weaponStrategy.attack()
    }
}

// Crear un robot con el cañón de plasma inicial
let robot = Robot(weaponStrategy: /* TODO */)
print("Robot ataca con arma inicial: \(robot.fight())")

// Cambiar a lanzallamas
robot.setWeaponStrategy(/* TODO */)
print("Robot ataca tras cambiar arma: \(robot.fight())")

// Cambiar a rayo electromagnético
robot.setWeaponStrategy(/* TODO */)
print("Robot ataca con nueva arma: \(robot.fight())")

// Demostrar reutilización del cañón de plasma
robot.setWeaponStrategy(/* TODO */)
print("Robot vuelve al arma inicial: \(robot.fight())")
