class BebidaCaliente {
    final func prepararBebida() {
        hervirAgua()
        prepararIngredientes()
        verterAgua()
        agregarCondimentos()
    }

    func prepararIngredientes() {
        fatalError("Este método debe ser implementado por una subclase")
    }

    func agregarCondimentos() {
        fatalError("Este método debe ser implementado por una subclase")
    }

    func hervirAgua() {
        print("Hirviendo agua")
    }

    func verterAgua() {
        print("Vertiendo agua caliente en la taza")
    }
}

class Cafe: BebidaCaliente {
    override func prepararIngredientes() {
        print("Moliendo granos de café")
    }

    override func agregarCondimentos() {
        print("Agregando azúcar y leche (opcional)")
    }
}

class Te: BebidaCaliente {
    override func prepararIngredientes() {
        print("Preparando bolsa de té")
    }

    override func agregarCondimentos() {
        print("Agregando limón y miel (opcional)")
    }
}

print("Preparando Café:")
let cafe = Cafe()
cafe.prepararBebida()

print("\nPreparando Té:")
let te = Te()
te.prepararBebida()
