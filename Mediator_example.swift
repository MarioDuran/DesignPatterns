import Foundation

protocol ChatMediator: AnyObject {
    func sendMessage(_ message: String, from user: AbstractUser)
    func addUser(_ user: AbstractUser)
}

class AbstractUser {
    private let name: String
    weak var mediator: ChatMediator?

    init(name: String) {
        self.name = name
    }

    func setMediator(_ mediator: ChatMediator) {
        self.mediator = mediator
    }

    func send(_ message: String) {
        fatalError("Este método debe ser implementado por una subclase")
    }

    func receiveMessage(_ message: String) {
        fatalError("Este método debe ser implementado por una subclase")
    }

    func getName() -> String {
        return name
    }
}

class ChatRoom: ChatMediator {
    private var users: [AbstractUser] = []

    func addUser(_ user: AbstractUser) {
        users.append(user)
        user.setMediator(self)
        notifyUsers("\(user.getName()) se ha unido al chat room")
    }

    func sendMessage(_ message: String, from user: AbstractUser) {
        notifyUsers("\(user.getName()): \(message)")
    }

    private func notifyUsers(_ message: String) {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss"

        let timestamp = formatter.string(from: Date())

        for user in users {
            user.receiveMessage("[\(timestamp)] \(message)")
        }
    }
}

class ChatUser: AbstractUser {
    override func send(_ message: String) {
        mediator?.sendMessage(message, from: self)
    }

    override func receiveMessage(_ message: String) {
        print("\(getName()) recibió: \(message)")
    }
}

let chatRoom = ChatRoom()

let usuario1 = ChatUser(name: "Ana")
let usuario2 = ChatUser(name: "Luis")
let usuario3 = ChatUser(name: "Carlos")

chatRoom.addUser(usuario1)
chatRoom.addUser(usuario2)
chatRoom.addUser(usuario3)

usuario1.send("Hola a todos")
usuario2.send("Hola Ana")
usuario3.send("Buenas tardes")
