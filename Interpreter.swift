/*
El patrón Interpreter es un patrón de diseño que permite definir una gramática para un lenguaje y evaluar expresiones en ese lenguaje.

Es ideal para interpretar lenguajes pequeños o específicos, como:

- Comandos.
- Expresiones matemáticas.
- Reglas de negocio.

En este ejercicio se implementará un intérprete para un lenguaje simple de comandos que controla un robot.

El robot puede ejecutar los siguientes comandos:

1. MOVE: mueve el robot una posición hacia adelante según su dirección actual.
2. LEFT: gira el robot hacia la izquierda.
3. RIGHT: gira el robot hacia la derecha.
4. REPEAT: repite una secuencia de comandos un número determinado de veces.

Requisitos:

Construya una secuencia de expresiones que lleve al robot desde su estado inicial:

Posición inicial: (0, 0), Dirección: N

hasta el siguiente estado final:

Posición final: (2, 3), Dirección: W

El objetivo es completar el programa usando las expresiones disponibles del patrón Interpreter.
*/

class RobotContext {
    var x: Int = 0
    var y: Int = 0
    var direction: String = "N"

    func move() {
        if direction == "N" {
            y += 1
        } else if direction == "S" {
            y -= 1
        } else if direction == "E" {
            x += 1
        } else if direction == "W" {
            x -= 1
        }
    }

    func turnLeft() {
        let directions = [
            "N": "W",
            "W": "S",
            "S": "E",
            "E": "N"
        ]

        direction = directions[direction] ?? direction
    }

    func turnRight() {
        let directions = [
            "N": "E",
            "E": "S",
            "S": "W",
            "W": "N"
        ]

        direction = directions[direction] ?? direction
    }
}

protocol Expression {
    func interpret(context: RobotContext)
}

class MoveExpression: Expression {
    func interpret(context: RobotContext) {
        context.move()
    }
}

class LeftExpression: Expression {
    func interpret(context: RobotContext) {
        context.turnLeft()
    }
}

class RightExpression: Expression {
    func interpret(context: RobotContext) {
        context.turnRight()
    }
}

class RepeatExpression: Expression {
    private let times: Int
    private let commands: [Expression]

    init(times: Int, commands: [Expression]) {
        self.times = times
        self.commands = commands
    }

    func interpret(context: RobotContext) {
        for _ in 0..<times {
            for command in commands {
                command.interpret(context: context)
            }
        }
    }
}

let robot = RobotContext()

let move = MoveExpression()
let left = LeftExpression()
let right = RightExpression()

// TODO: Construir la secuencia de comandos usando las expresiones disponibles.
// La secuencia debe llevar al robot a:
// Posición final: (2, 3), Dirección: W
//
// Puede usar:
// - move
// - left
// - right
// - RepeatExpression(times:commands:)

let program: [Expression] = [
    // TODO: Agregar aquí las expresiones necesarias.
]

for expression in program {
    expression.interpret(context: robot)
}

print("Posición final: (\(robot.x), \(robot.y)), Dirección: \(robot.direction)")
