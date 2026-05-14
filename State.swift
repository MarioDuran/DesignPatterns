/*
Patrón de diseño State

El patrón State permite que un objeto altere su comportamiento cuando cambia
su estado interno, pareciendo como si cambiara de clase.

En este ejercicio, se implementará un sistema para una máquina expendedora de
bebidas que puede estar en diferentes estados:

- NoMoneyState
- HasMoneyState
- DispensingState
- OutOfStockState

Cada estado define comportamientos específicos para acciones como:

- Insertar dinero
- Seleccionar una bebida
- Dispensar una bebida
- Reabastecer la máquina

Requerimiento:

Cree una máquina expendedora que use el patrón State. La máquina debe tener
cuatro estados: NoMoneyState, HasMoneyState, DispensingState y OutOfStockState.

Implemente las transiciones entre estados según las acciones del usuario:

- Insertar dinero
- Seleccionar bebida
- Dispensar bebida
- Reabastecer la máquina

Deje los cambios de estado pendientes marcados con TODO.
*/

protocol State {
    func insertMoney(_ machine: VendingMachine)
    func selectDrink(_ machine: VendingMachine)
    func dispense(_ machine: VendingMachine)
    func restock(_ machine: VendingMachine)
}

extension State {
    func insertMoney(_ machine: VendingMachine) {
        print("Acción no permitida en este estado.")
    }

    func selectDrink(_ machine: VendingMachine) {
        print("Acción no permitida en este estado.")
    }

    func dispense(_ machine: VendingMachine) {
        print("Acción no permitida en este estado.")
    }

    func restock(_ machine: VendingMachine) {
        print("Acción no permitida en este estado.")
    }
}

class VendingMachine {
    var inventory: Int
    private var state: any State

    init(inventory: Int = 10) {
        self.inventory = inventory
        self.state = inventory > 0 ? NoMoneyState() : OutOfStockState()
    }

    func setState(_ state: any State) {
        self.state = state
        print("Estado cambiado a: \(type(of: state))")
    }

    func insertMoney() {
        state.insertMoney(self)
    }

    func selectDrink() {
        state.selectDrink(self)
    }

    func dispense() {
        state.dispense(self)
    }

    func restock() {
        state.restock(self)
    }
}

class NoMoneyState: State {
    func insertMoney(_ machine: VendingMachine) {
        print("Dinero insertado.")

        // TODO: Cambiar al estado correcto
    }
}

class HasMoneyState: State {
    func selectDrink(_ machine: VendingMachine) {
        print("Bebida seleccionada.")

        // TODO: Cambiar al estado correcto
    }
}

class DispensingState: State {
    func dispense(_ machine: VendingMachine) {
        if machine.inventory > 0 {
            print("Bebida dispensada.")
            machine.inventory -= 1

            if machine.inventory == 0 {
                // TODO: Cambiar al estado correcto
            } else {
                // TODO: Cambiar al estado correcto
            }
        } else {
            print("Sin inventario.")

            // TODO: Cambiar al estado correcto
        }
    }
}

class OutOfStockState: State {
    func restock(_ machine: VendingMachine) {
        machine.inventory = 10
        print("Máquina reabastecida.")

        // TODO: Cambiar al estado correcto
    }
}
