protocol Command {
    func execute() -> String
}

class GameCharacter {
    let name: String

    init(name: String) {
        self.name = name
    }

    func jump() -> String {
        return "\(name) is jumping!"
    }

    func shoot() -> String {
        return "\(name) is shooting!"
    }
}

class JumpCommand: Command {
    private let character: GameCharacter

    init(character: GameCharacter) {
        self.character = character
    }

    func execute() -> String {
        return character.jump()
    }
}

class ShootCommand: Command {
    private let character: GameCharacter

    init(character: GameCharacter) {
        self.character = character
    }

    func execute() -> String {
        return character.shoot()
    }
}

class InputHandler {
    private var commands: [String: any Command] = [:]

    func setCommand(button: String, command: any Command) {
        commands[button] = command
    }

    func pressButton(_ button: String) -> String {
        guard let command = commands[button] else {
            return "No command assigned to this button"
        }

        return command.execute()
    }
}

let hero = GameCharacter(name: "Hero")

let jumpCommand = JumpCommand(character: hero)
let shootCommand = ShootCommand(character: hero)
let inputHandler = InputHandler()

inputHandler.setCommand(button: "A", command: jumpCommand)
inputHandler.setCommand(button: "B", command: shootCommand)

let actions = ["A", "B", "X"]

for action in actions {
    print(inputHandler.pressButton(action))
}
