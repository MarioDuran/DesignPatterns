import Foundation

/*
Diseña un sistema para representar el menú de un restaurante usando el patrón Composite.
El menú puede tener secciones (como "Entradas", "Platos Principales") que contienen
elementos individuales (como "Ensalada" o "Pizza"). Cada elemento tiene un nombre y un precio.
Las secciones pueden contener otros elementos o subsecciones.

El sistema debe:
- Calcular el precio total de una sección (suma de sus elementos).
- Mostrar la estructura completa del menú con indentación.

Requisitos:
- Crea una clase base abstracta MenuComponent con métodos abstractos getPrice() y display().
- Implementa una clase MenuItem para elementos individuales (hojas).
- Implementa una clase MenuSection para secciones que puedan contener otros componentes.
- Asegúrate de que MenuSection pueda agregar y remover componentes.
- Usa el código base proporcionado y complétalo.
*/

class MenuComponent {
}

class MenuItem: MenuComponent {
    let name: String
    let price: Double

    init(name: String, price: Double) {
        self.name = name
        self.price = price
    }
}

class MenuSection: MenuComponent {
    let name: String

    init(name: String) {
        self.name = name
    }

    func add(_ component: MenuComponent) {
    }

    func remove(_ component: MenuComponent) {
    }

    override func getPrice() -> Double {
    }

    override func display(indent: String = "") {
    }
}

let salad = MenuItem(name: "Ensalada", price: 5.00)
let soup = MenuItem(name: "Sopa", price: 3.50)
let pizza = MenuItem(name: "Pizza", price: 20.00)

let starters = MenuSection(name: "Entradas")
starters.add(salad)
starters.add(soup)

let mainMenu = MenuSection(name: "Menú Principal")
mainMenu.add(starters)
mainMenu.add(pizza)

mainMenu.display()
