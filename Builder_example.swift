enum Dough: String {
    case thin = "thin"
    case thick = "thick"
}

enum Sauce: String {
    case tomato = "tomato"
    case spicy = "spicy"
}

enum Topping: String {
    case cheese = "cheese"
    case mozzarella = "mozzarella"
    case pepperoni = "pepperoni"
}

class Pizza: CustomStringConvertible {
    var dough: Dough?
    var sauce: Sauce?
    var topping: Topping?

    init(dough: Dough? = nil, sauce: Sauce? = nil, topping: Topping? = nil) {
        self.dough = dough
        self.sauce = sauce
        self.topping = topping
    }

    var description: String {
        return "Pizza with \(dough?.rawValue ?? "no") dough, \(sauce?.rawValue ?? "no") sauce, and \(topping?.rawValue ?? "no") topping."
    }
}

class PizzaBuilder {
    private var pizza = Pizza()

    func reset() {
        pizza = Pizza()
    }

    func setDough(_ dough: Dough) -> PizzaBuilder {
        pizza.dough = dough
        return self
    }

    func setSauce(_ sauce: Sauce) -> PizzaBuilder {
        pizza.sauce = sauce
        return self
    }

    func setTopping(_ topping: Topping) -> PizzaBuilder {
        pizza.topping = topping
        return self
    }

    func build() -> Pizza {
        let finishedPizza = pizza
        reset()
        return finishedPizza
    }
}

class PizzaDirector {
    private let builder: PizzaBuilder

    init(builder: PizzaBuilder) {
        self.builder = builder
    }

    func makeMargherita() -> Pizza {
        return builder
            .setDough(.thin)
            .setSauce(.tomato)
            .setTopping(.mozzarella)
            .build()
    }

    func makePepperoni() -> Pizza {
        return builder
            .setDough(.thick)
            .setSauce(.spicy)
            .setTopping(.pepperoni)
            .build()
    }
}

let customPizza = PizzaBuilder()
    .setDough(.thin)
    .setSauce(.tomato)
    .setTopping(.cheese)
    .build()

print(customPizza)

let director = PizzaDirector(builder: PizzaBuilder())

let margherita = director.makeMargherita()
print(margherita)

let pepperoni = director.makePepperoni()
print(pepperoni)
