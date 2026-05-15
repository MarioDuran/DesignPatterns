protocol Expression {
    func interpret(_ context: [String: Int]) -> Int
}

final class NumberExpression: Expression {
    private let value: Int

    init(_ value: Int) {
        self.value = value
    }

    func interpret(_ context: [String: Int]) -> Int {
        return value
    }
}

final class AddExpression: Expression {
    private let left: any Expression
    private let right: any Expression

    init(_ left: any Expression, _ right: any Expression) {
        self.left = left
        self.right = right
    }

    func interpret(_ context: [String: Int]) -> Int {
        return left.interpret(context) + right.interpret(context)
    }
}

final class SubtractExpression: Expression {
    private let left: any Expression
    private let right: any Expression

    init(_ left: any Expression, _ right: any Expression) {
        self.left = left
        self.right = right
    }

    func interpret(_ context: [String: Int]) -> Int {
        return left.interpret(context) - right.interpret(context)
    }
}

let expression: any Expression = SubtractExpression(
    AddExpression(
        NumberExpression(5),
        NumberExpression(3)
    ),
    NumberExpression(2)
)

let result = expression.interpret([:])
print("Resultado: \(result)")
