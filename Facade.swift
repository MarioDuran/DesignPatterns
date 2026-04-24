/*
Crea una clase CoffeeShopFacade que coordine los subsistemas para preparar un café.

El método principal de la fachada debe ser make_coffee(coffee_type) ("Latte" o "Espresso").

Si el tipo de café es "Espresso":
- Encender molino
- Moler café
- Encender máquina de espresso
- Preparar un espresso

Si el tipo de café es "Latte":
- Encender molino
- Moler café
- Encender máquina de espresso
- Preparar un espresso
- Encender espumador
- Espumar leche

Después de realizar el pedido apagar los dispositivos que se encendieron.
*/

class CoffeeGrinder {
    func on() {
        print("Encendiendo molino")
    }

    func grindBeans() {
        print("Moliendo granos de café")
    }

    func off() {
        print("Apagando molinillo de café")
    }
}

class EspressoMachine {
    func on() {
        print("Encendiendo máquina de espresso")
    }

    func brewEspresso() {
        print("Preparando espresso")
    }

    func off() {
        print("Apagando máquina de espresso")
    }
}

class MilkFrother {
    func on() {
        print("Encendiendo espumador de leche")
    }

    func frothMilk() {
        print("Espumando leche")
    }

    func off() {
        print("Apagando espumador de leche")
    }
}

// Fachada
class CoffeeShopFacade {
    let grinder: CoffeeGrinder
    let espressoMachine: EspressoMachine
    let milkFrother: MilkFrother

    init() {
        self.grinder = CoffeeGrinder()
        self.espressoMachine = EspressoMachine()
        self.milkFrother = MilkFrother()
    }

    func makeCoffee(_ coffeeType: String) {
        // TODO
    }

    func shutdown(_ coffeeType: String) {
        // TODO
    }
}

let coffeeShop = CoffeeShopFacade()
coffeeShop.makeCoffee("Latte")
print("\n")
coffeeShop.makeCoffee("Espresso")
