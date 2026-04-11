import Foundation

protocol NotificationSender {
    func send(to recipient: String, message: String)
}

final class EmailSender: NotificationSender {
    func send(to recipient: String, message: String) {
        print("Sending EMAIL to \(recipient): \(message)")
    }
}

final class SMSSender: NotificationSender {
    func send(to recipient: String, message: String) {
        print("Sending SMS to \(recipient): \(message)")
    }
}

final class PushSender: NotificationSender {
    func send(to recipient: String, message: String) {
        print("Sending PUSH notification to \(recipient): \(message)")
    }
}

enum NotificationType {
    case email
    case sms
    case push
}

final class NotificationFactory {
    static func createSender(type: NotificationType) -> NotificationSender {
        switch type {
        case .email:
            return EmailSender()
        case .sms:
            return SMSSender()
        case .push:
            return PushSender()
        }
    }
}

let sender = NotificationFactory.createSender(type: .email)
sender.send(to: "mario@company.com", message: "Your account was created successfully")

let smsSender = NotificationFactory.createSender(type: .sms)
smsSender.send(to: "+521234567890", message: "Your verification code is 123456")
