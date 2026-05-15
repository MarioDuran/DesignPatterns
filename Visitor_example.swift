protocol Expression {
    func accept(_ visitor: any Visitor) -> Any
}

final class Number: Expression {
    let value: Int

    init(_ value: Int) {
        self.value = value
    }

    func accept(_ visitor: any Visitor) -> Any {
        return visitor.visitNumber(self)
    }
}

final class Addition: Expression {
    let left: any Expression
    let right: any Expression

    init(_ left: any Expression, _ right: any Expression) {
        self.left = left
        self.right = right
    }

    func accept(_ visitor: any Visitor) -> Any {
        return visitor.visitAddition(self)
    }
}

protocol Visitor {
    func visitNumber(_ number: Number) -> Any
    func visitAddition(_ addition: Addition) -> Any
}

final class PrintVisitor: Visitor {
    func visitNumber(_ number: Number) -> Any {
        return String(number.value)
    }

    func visitAddition(_ addition: Addition) -> Any {
        let left = addition.left.accept(self) as! String
        let right = addition.right.accept(self) as! String
        return "(\(left) + \(right))"
    }
}

final class EvaluateVisitor: Visitor {
    func visitNumber(_ number: Number) -> Any {
        return number.value
    }

    func visitAddition(_ addition: Addition) -> Any {
        let left = addition.left.accept(self) as! Int
        let right = addition.right.accept(self) as! Int
        return left + right
    }
}

let expression: any Expression = Addition(
    Number(5),
    Addition(Number(3), Number(2))
)

let printVisitor = PrintVisitor()
let evaluateVisitor = EvaluateVisitor()

let printed = expression.accept(printVisitor) as! String
let evaluated = expression.accept(evaluateVisitor) as! Int

print(printed)
print(evaluated)
