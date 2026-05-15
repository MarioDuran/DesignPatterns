final class Memento {
    private let state: String?

    init(state: String?) {
        self.state = state
    }

    func getState() -> String? {
        return state
    }
}

final class Originator {
    private var state: String?

    func setState(_ state: String) {
        self.state = state
    }

    func getState() -> String? {
        return state
    }

    func createMemento() -> Memento {
        return Memento(state: state)
    }

    func restoreMemento(_ memento: Memento) {
        self.state = memento.getState()
    }
}

final class Caretaker {
    private var mementos: [Memento] = []

    func addMemento(_ memento: Memento) {
        mementos.append(memento)
    }

    func getMemento(at index: Int) -> Memento {
        return mementos[index]
    }
}

let originator = Originator()
let caretaker = Caretaker()

originator.setState("Estado 1")
print("Estado actual: \(originator.getState() ?? "")")
caretaker.addMemento(originator.createMemento())

originator.setState("Estado 2")
print("Estado actual: \(originator.getState() ?? "")")
caretaker.addMemento(originator.createMemento())

originator.restoreMemento(caretaker.getMemento(at: 0))
print("Estado restaurado: \(originator.getState() ?? "")")
