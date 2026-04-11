import Foundation

protocol Button {
    func render() -> String
}

protocol Checkbox {
    func render() -> String
}

struct WindowsButton: Button {
    func render() -> String {
        "Rendering a Windows-style button"
    }
}

struct WindowsCheckbox: Checkbox {
    func render() -> String {
        "Rendering a Windows-style checkbox"
    }
}

struct MacButton: Button {
    func render() -> String {
        "Rendering a Mac-style button"
    }
}

struct MacCheckbox: Checkbox {
    func render() -> String {
        "Rendering a Mac-style checkbox"
    }
}

protocol GUIFactory {
    func createButton() -> Button
    func createCheckbox() -> Checkbox
}

struct WindowsFactory: GUIFactory {
    func createButton() -> Button {
        WindowsButton()
    }

    func createCheckbox() -> Checkbox {
        WindowsCheckbox()
    }
}

struct MacFactory: GUIFactory {
    func createButton() -> Button {
        MacButton()
    }

    func createCheckbox() -> Checkbox {
        MacCheckbox()
    }
}

struct Application {
    private let button: Button
    private let checkbox: Checkbox

    init(factory: GUIFactory) {
        self.button = factory.createButton()
        self.checkbox = factory.createCheckbox()
    }

    func render() {
        print(button.render())
        print(checkbox.render())
    }
}

let factory = MacFactory()
let app = Application(factory: factory)
app.render()
