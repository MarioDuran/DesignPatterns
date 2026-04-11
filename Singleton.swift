import Foundation

// Problema: Configuración Única de Juego
//
// Imagina que estás desarrollando un videojuego y necesitas asegurarte de que
// solo exista una única configuración global del juego en todo momento.
//
// Esta configuración debe incluir parámetros como:
// - la dificultad ("fácil", "medio", "difícil")
// - el volumen del sonido (0-100)
// - la resolución de pantalla (por ejemplo, "1920x1080", "1280x720")
//
// Para garantizar que no se creen múltiples instancias de esta configuración
// y que todos los componentes del juego usen la misma, debes implementar
// el patrón Singleton.


// Ejercicio:
//
// Modifica y extiende el código base del Singleton para crear una clase GameConfig que:
//
// 1. Asegure que solo exista una única instancia de la configuración del juego.
// 2. Permita establecer y obtener los valores de dificultad, volumen y resolución.
// 3. Incluya validaciones básicas:
//    - volumen entre 0 y 100
//    - resoluciones predefinidas
//    - dificultad válida
// 4. Proporcione un ejemplo de uso en el código.

class GameConfig {
    
    // TODO: Declarar una instancia estática única del Singleton
    
    // Propiedades privadas para la configuración
    private var difficulty: String
    private var volume: Int
    private var resolution: String
    
    // Valores permitidos
    private let validDifficulties = ["fácil", "medio", "difícil"]
    private let validResolutions = ["1920x1080", "1280x720", "2560x1440"]
    
    // TODO: Hacer el inicializador privado para impedir la creación
    // de instancias desde fuera de la clase
    
    // TODO: Implementar método para establecer la dificultad
    // Debe validar que el valor sea "fácil", "medio" o "difícil"
    func setDifficulty(_ difficulty: String) {
    }
    
    // TODO: Implementar método para establecer el volumen
    // Debe validar que esté en el rango 0...100
    func setVolume(_ volume: Int) {
      
    }
    
    // TODO: Implementar método para establecer la resolución
    // Debe validar que sea una de las resoluciones predefinidas
    func setResolution(_ resolution: String) {
      
    }
    
    // TODO: Implementar métodos para obtener los valores actuales
    func getDifficulty() -> String {
    }
    
    func getVolume() -> Int {
    }
    
    func getResolution() -> String {
    }
}


// Ejemplo de uso
//
// Obtener la única instancia de GameConfig
let config = GameConfig.shared

// Configurar valores
config.setDifficulty("medio")
config.setVolume(75)
config.setResolution("1280x720")

// Mostrar los valores
print("Dificultad: \(config.getDifficulty())")   // Salida: Dificultad: medio
print("Volumen: \(config.getVolume())")         // Salida: Volumen: 75
print("Resolución: \(config.getResolution())")  // Salida: Resolución: 1280x720

// Verificar que es la misma instancia
let config2 = GameConfig.shared
print("Misma instancia: \(config === config2)") // Salida: Misma instancia: true

// Probar validaciones
config.setVolume(150)                  // Error: el volumen debe estar entre 0 y 100.
config.setResolution("1024x768")       // Error: resolución no válida.
config.setDifficulty("extremo")        // Error: dificultad no válida.
