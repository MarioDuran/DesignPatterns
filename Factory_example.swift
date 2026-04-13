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

protocol NotificationCreator {
    func createSender() -> NotificationSender
}

final class EmailCreator: NotificationCreator {
    func createSender() -> NotificationSender {
        return EmailSender()
    }
}

final class SMSCreator: NotificationCreator {
    func createSender() -> NotificationSender {
        return SMSSender()
    }
}

final class PushCreator: NotificationCreator {
    func createSender() -> NotificationSender {
        return PushSender()
    }
}

func notify(using creator: NotificationCreator, recipient: String, message: String) {
    let sender = creator.createSender()
    sender.send(to: recipient, message: message)
}

let emailCreator = EmailCreator()
notify(using: emailCreator,
       recipient: "mario@company.com",
       message: "Your account was created successfully")

let smsCreator = SMSCreator()
notify(using: smsCreator,
       recipient: "+521234567890",
       message: "Your verification code is 123456")

let pushCreator = PushCreator()
notify(using: pushCreator,
       recipient: "user_device_token_001",
       message: "You have a new message")
