import Foundation

protocol Cafe {
    func costo() -> Double
    func descripcion() -> String
}

final class CafeSimple: Cafe {
    func costo() -> Double {
        5
    }

    func descripcion() -> String {
        "Café simple"
    }
}

class DecoradorCafe: Cafe {
    let cafe: Cafe

    init(_ cafe: Cafe) {
        self.cafe = cafe
    }

    func costo() -> Double {
        fatalError("Debe implementarse en la subclase")
    }

    func descripcion() -> String {
        fatalError("Debe implementarse en la subclase")
    }
}

final class Leche: DecoradorCafe {
    override func costo() -> Double {
        cafe.costo() + 2
    }

    override func descripcion() -> String {
        cafe.descripcion() + ", con leche"
    }
}

final class Chocolate: DecoradorCafe {
    override func costo() -> Double {
        cafe.costo() + 3
    }

    override func descripcion() -> String {
        cafe.descripcion() + ", con chocolate"
    }
}

final class Canela: DecoradorCafe {
    override func costo() -> Double {
        cafe.costo() + 1.5
    }

    override func descripcion() -> String {
        cafe.descripcion() + ", con canela"
    }
}

let cafe = CafeSimple()
print("\(cafe.descripcion()) - $\(cafe.costo())")

let cafeConLeche = Leche(cafe)
print("\(cafeConLeche.descripcion()) - $\(cafeConLeche.costo())")

let cafeEspecial = Chocolate(Leche(cafe))
print("\(cafeEspecial.descripcion()) - $\(cafeEspecial.costo())")

let cafeCompleto = Canela(Chocolate(Leche(cafe)))
print("\(cafeCompleto.descripcion()) - $\(cafeCompleto.costo())")
