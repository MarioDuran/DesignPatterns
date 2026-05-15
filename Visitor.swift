/*
Patrón de diseño Visitor

Este patrón es útil cuando se necesita realizar operaciones sobre una estructura
de objetos sin modificar sus clases.

Requerimientos:

Implemente el patrón Visitor para calcular el perímetro de las figuras
geométricas:

- Circle
- Rectangle
- Triangle

El programa ya incluye:

- Una jerarquía de figuras geométricas.
- Un visitante para calcular el área.
- La estructura base para implementar un visitante que calcule el perímetro.

El estudiante debe completar los TODO correspondientes para:

- Implementar el visitante PerimeterCalculator.
- Crear una instancia del visitante de perímetro.
- Usar el método accept para calcular el perímetro de cada figura.
*/

import Foundation

protocol Shape {
    func accept(_ visitor: ShapeVisitor) -> Double
}

class Circle: Shape {
    let radius: Double

    init(radius: Double) {
        self.radius = radius
    }

    func accept(_ visitor: ShapeVisitor) -> Double {
        return visitor.visitCircle(self)
    }
}

class Rectangle: Shape {
    let width: Double
    let height: Double

    init(width: Double, height: Double) {
        self.width = width
        self.height = height
    }

    func accept(_ visitor: ShapeVisitor) -> Double {
        return visitor.visitRectangle(self)
    }
}

class Triangle: Shape {
    let base: Double
    let height: Double

    init(base: Double, height: Double) {
        self.base = base
        self.height = height
    }

    func accept(_ visitor: ShapeVisitor) -> Double {
        return visitor.visitTriangle(self)
    }
}

protocol ShapeVisitor {
    func visitCircle(_ circle: Circle) -> Double
    func visitRectangle(_ rectangle: Rectangle) -> Double
    func visitTriangle(_ triangle: Triangle) -> Double
}

class AreaCalculator: ShapeVisitor {
    func visitCircle(_ circle: Circle) -> Double {
        return Double.pi * pow(circle.radius, 2)
    }

    func visitRectangle(_ rectangle: Rectangle) -> Double {
        return rectangle.width * rectangle.height
    }

    func visitTriangle(_ triangle: Triangle) -> Double {
        return 0.5 * triangle.base * triangle.height
    }
}

class PerimeterCalculator: ShapeVisitor {
    func visitCircle(_ circle: Circle) -> Double {
        // TODO: Calcular y retornar el perímetro del círculo
        return 0.0
    }

    func visitRectangle(_ rectangle: Rectangle) -> Double {
        // TODO: Calcular y retornar el perímetro del rectángulo
        return 0.0
    }

    func visitTriangle(_ triangle: Triangle) -> Double {
        // TODO: Calcular y retornar el perímetro del triángulo
        return 0.0
    }
}

let shapes: [Shape] = [
    Circle(radius: 5),
    Rectangle(width: 4, height: 6),
    Triangle(base: 3, height: 7)
]

let areaVisitor = AreaCalculator()

// TODO: Crear el visitante para calcular el perímetro
let perimeterVisitor = PerimeterCalculator()

for shape in shapes {
    let className = String(describing: type(of: shape))

    let area = shape.accept(areaVisitor)

    // TODO: Usar accept con el visitante de perímetro
    let perimeter = 0.0

    print("\(className) -> Área: \(String(format: "%.2f", area)), Perímetro: \(String(format: "%.2f", perimeter))")
}
