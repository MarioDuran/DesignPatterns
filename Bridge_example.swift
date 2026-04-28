protocol DrawingAPI {
    func drawCircle(x: Double, y: Double, radius: Double)
    func drawLine(x1: Double, y1: Double, x2: Double, y2: Double)
}

final class DrawingOpenGL: DrawingAPI {
    func drawCircle(x: Double, y: Double, radius: Double) {
        print("OpenGL: Dibujando círculo en (\(x), \(y)) con radio \(radius)")
    }

    func drawLine(x1: Double, y1: Double, x2: Double, y2: Double) {
        print("OpenGL: Dibujando línea desde (\(x1), \(y1)) hasta (\(x2), \(y2))")
    }
}

final class DrawingMetal: DrawingAPI {
    func drawCircle(x: Double, y: Double, radius: Double) {
        print("Metal: Renderizando círculo en (\(x), \(y)) con radio \(radius)")
    }

    func drawLine(x1: Double, y1: Double, x2: Double, y2: Double) {
        print("Metal: Renderizando línea desde (\(x1), \(y1)) hasta (\(x2), \(y2))")
    }
}

protocol Shape {
    func draw()
    func scale(_ factor: Double)
}

final class Circle: Shape {
    private var x: Double
    private var y: Double
    private var radius: Double
    private let drawingAPI: DrawingAPI

    init(x: Double, y: Double, radius: Double, drawingAPI: DrawingAPI) {
        self.x = x
        self.y = y
        self.radius = radius
        self.drawingAPI = drawingAPI
    }

    func draw() {
        drawingAPI.drawCircle(x: x, y: y, radius: radius)
    }

    func scale(_ factor: Double) {
        radius *= factor
    }
}

final class Line: Shape {
    private var x1: Double
    private var y1: Double
    private var x2: Double
    private var y2: Double
    private let drawingAPI: DrawingAPI

    init(x1: Double, y1: Double, x2: Double, y2: Double, drawingAPI: DrawingAPI) {
        self.x1 = x1
        self.y1 = y1
        self.x2 = x2
        self.y2 = y2
        self.drawingAPI = drawingAPI
    }

    func draw() {
        drawingAPI.drawLine(x1: x1, y1: y1, x2: x2, y2: y2)
    }

    func scale(_ factor: Double) {
        x2 = x1 + (x2 - x1) * factor
        y2 = y1 + (y2 - y1) * factor
    }
}

let shapes: [Shape] = [
    Circle(x: 1.0, y: 2.0, radius: 3.0, drawingAPI: DrawingOpenGL()),
    Circle(x: 5.0, y: 7.0, radius: 2.0, drawingAPI: DrawingMetal()),
    Line(x1: 0.0, y1: 0.0, x2: 10.0, y2: 10.0, drawingAPI: DrawingOpenGL()),
    Line(x1: 2.0, y1: 2.0, x2: 8.0, y2: 8.0, drawingAPI: DrawingMetal())
]

print("Dibujando formas originales:")
for shape in shapes {
    shape.draw()
}

print("\nEscalando formas y dibujando de nuevo:")
for shape in shapes {
    shape.scale(2.0)
    shape.draw()
}
