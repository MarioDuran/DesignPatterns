final class MiSingleton {
    
    static let shared = MiSingleton()
    var nombre: String = "Instancia Única"
    private init() {
        print("Singleton inicializado")
    }
    
    func hacerAlgo() {
        print("El Singleton está haciendo algo con: \(nombre)")
    }
}

let instancia1 = MiSingleton.shared
let instancia2 = MiSingleton.shared

let direccion1 = Unmanaged.passUnretained(instancia1).toOpaque()
let direccion2 = Unmanaged.passUnretained(instancia2).toOpaque()

MiSingleton.shared.hacerAlgo()

print("Dirección de instancia 1: \(direccion1)")
print("Dirección de instancia 2: \(direccion2)")
