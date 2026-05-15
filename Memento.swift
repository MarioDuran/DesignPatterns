/*
El patrón Memento es un patrón de diseño que permite capturar y restaurar el estado interno de un objeto sin violar su encapsulación.

Es útil en escenarios donde se necesita implementar funcionalidades como "deshacer" o "restaurar" estados anteriores.

En este ejercicio, se simulará un sistema de configuración de un editor de texto que guarda y restaura preferencias del usuario, como:

- Tema.
- Tamaño de fuente.
- Modo oscuro.
- Color de letra.

Requisitos:

Añade al estado memento una variable que contenga el color de la letra.

El color de letra debe poder:
1. Guardarse dentro del memento.
2. Restaurarse desde el memento.
3. Consultarse como parte de la configuración actual del editor.

El objetivo es modificar las clases necesarias para que el patrón Memento también conserve el color de letra.
*/

class ConfigMemento {
    private let theme: String
    private let fontSize: Int
    private let darkMode: Bool

    // TODO: Agregar propiedad para almacenar el color de letra.

    init(theme: String, fontSize: Int, darkMode: Bool) {
        self.theme = theme
        self.fontSize = fontSize
        self.darkMode = darkMode

        // TODO: Inicializar el color de letra.
    }

    func getState() -> [String: Any] {
        return [
            "theme": theme,
            "fontSize": fontSize,
            "darkMode": darkMode

            // TODO: Agregar el color de letra al estado.
        ]
    }
}

class EditorConfig {
    private var theme: String = "Light"
    private var fontSize: Int = 12
    private var darkMode: Bool = false

    // TODO: Agregar propiedad para el color de letra con un valor inicial.

    func setConfig(theme: String, fontSize: Int, darkMode: Bool) {
        self.theme = theme
        self.fontSize = fontSize
        self.darkMode = darkMode

        // TODO: Asignar el color de letra recibido.
    }

    func getConfig() -> [String: Any] {
        return [
            "theme": theme,
            "fontSize": fontSize,
            "darkMode": darkMode

            // TODO: Agregar el color de letra a la configuración actual.
        ]
    }

    func createMemento() -> ConfigMemento {
        // TODO: Crear el memento incluyendo el color de letra.
        return ConfigMemento(theme: theme, fontSize: fontSize, darkMode: darkMode)
    }

    func restoreMemento(_ memento: ConfigMemento) {
        let state = memento.getState()

        theme = state["theme"] as? String ?? "Light"
        fontSize = state["fontSize"] as? Int ?? 12
        darkMode = state["darkMode"] as? Bool ?? false

        // TODO: Restaurar el color de letra desde el memento.
    }
}

class ConfigHistory {
    private var mementos: [ConfigMemento] = []

    func addMemento(_ memento: ConfigMemento) {
        mementos.append(memento)
    }

    func getMemento(at index: Int) -> ConfigMemento {
        return mementos[index]
    }
}

let editor = EditorConfig()
let history = ConfigHistory()

// Configuración inicial

// TODO: Configurar el editor incluyendo el color de letra.
editor.setConfig(theme: "Light", fontSize: 12, darkMode: false)

print("Configuración actual: \(editor.getConfig())")
history.addMemento(editor.createMemento())

// Nueva configuración

// TODO: Configurar nuevamente el editor incluyendo otro color de letra.
editor.setConfig(theme: "Dark", fontSize: 14, darkMode: true)

print("Configuración actual: \(editor.getConfig())")
history.addMemento(editor.createMemento())

// Restaurar primera configuración

editor.restoreMemento(history.getMemento(at: 0))
print("Configuración restaurada: \(editor.getConfig())")
