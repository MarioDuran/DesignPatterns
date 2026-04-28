import Foundation

protocol Observer: AnyObject {
    func update(state: String?)
}

final class Subject {
    private var observers: [Observer] = []
    private var state: String?

    func attach(_ observer: Observer) {
        observers.append(observer)
    }

    func detach(_ observer: Observer) {
        observers.removeAll { $0 === observer }
    }

    func notify() {
        for observer in observers {
            observer.update(state: state)
        }
    }

    func setState(_ state: String) {
        self.state = state
        notify()
    }
}

final class ConcreteObserver: Observer {
    private let name: String

    init(name: String) {
        self.name = name
    }

    func update(state: String?) {
        print("\(name) received update: \(state ?? "nil")")
    }
}

let subject = Subject()

let observer1 = ConcreteObserver(name: "Observer 1")
let observer2 = ConcreteObserver(name: "Observer 2")

subject.attach(observer1)
subject.attach(observer2)

subject.setState("New State")
// Observer 1 received update: New State
// Observer 2 received update: New State

subject.detach(observer2)

subject.setState("Another State")
// Observer 1 received update: Another State
