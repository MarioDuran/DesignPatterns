/*
 Ejercicio: Patrón Flyweight en Swift

 Objetivo:
 Reducir el consumo de memoria compartiendo datos intrínsecos
 entre múltiples instancias, y separando los datos extrínsecos.

 Los datos intrínsecos son aquellos que pueden compartirse:
 - Tipo de ícono.
 - Datos de imagen simulados.

 Los datos extrínsecos son aquellos que cambian por instancia:
 - Coordenada x.
 - Coordenada y.

 Requisitos:

 - Clase IconType:
   - Debe ser inmutable.
   - Contiene datos intrínsecos:
     - tipo de ícono.
     - datos de imagen simulados, equivalentes a una tupla de 500 enteros.
   - Debe tener un método render() que simule la representación del ícono.

 - Clase Icon:
   - Contiene datos extrínsecos:
     - coordenada x.
     - coordenada y.
   - Tiene una referencia a una instancia compartida de IconType.
   - Debe tener un método draw() o similar que delegue la renderización a IconType.

 - IconFactory:
   - Debe reutilizar instancias de IconType.
   - Si un tipo de ícono ya existe, debe regresar la instancia existente.
   - Si no existe, debe crearla y almacenarla.

 - Canvas:
   - Debe contener múltiples íconos.
   - Debe usar IconFactory para compartir IconType.
*/

// TODO: Implement final class IconType
// Two variables iconType, imageData
// Two methods, init, render
final class IconType {

}

// TODO: Implement final class Icon
// Three variabales, x, y and iconType.
// Two methods, init, and draw
final class Icon {

}

// Fábrica Flyweight
final class IconFactory {
    private var iconTypes: [String: IconType] = [:]

    func getIconType(_ iconType: String) -> IconType {
        if let existingIconType = iconTypes[iconType] {
            return existingIconType
        }

        let imageData = Array(repeating: 0, count: 500)
        let newIconType = IconType(iconType: iconType, imageData: imageData)

        iconTypes[iconType] = newIconType
        return newIconType
    }

    var allIconTypes: [IconType] {
        Array(iconTypes.values)
    }
}

// Cliente que usa los Flyweights
final class Canvas {
    private var icons: [Icon] = []
    private let iconFactory = IconFactory()

    func addIcon(x: Int, y: Int, iconType: String) {
        let sharedIconType = iconFactory.getIconType(iconType)
        let icon = Icon(x: x, y: y, iconType: sharedIconType)
        icons.append(icon)
    }

    func drawIcons() {
        for icon in icons {
            icon.draw()
        }
    }

    func getMemoryUsage() -> Double {
        var totalSize = 0

        // Memoria aproximada del arreglo de referencias a Icon
        totalSize += MemoryLayout<[Icon]>.stride
        totalSize += icons.capacity * MemoryLayout<Icon>.stride

        // Memoria aproximada de cada Icon:
        // x, y y referencia compartida a IconType
        for _ in icons {
            totalSize += MemoryLayout<Int>.stride
            totalSize += MemoryLayout<Int>.stride
            totalSize += MemoryLayout<IconType>.stride
        }

        // Memoria aproximada de los IconType compartidos
        for iconType in iconFactory.allIconTypes {
            totalSize += MemoryLayout<IconType>.stride
            totalSize += iconType.iconType.utf8.count
            totalSize += MemoryLayout<[Int]>.stride
            totalSize += iconType.imageData.count * MemoryLayout<Int>.stride
        }

        let megabytes = Double(totalSize) / Double(1024 * 1024)
        return (megabytes * 100).rounded() / 100
    }
}

let canvas = Canvas()

for i in 0..<1000 {
    canvas.addIcon(x: i, y: i, iconType: "star")
    canvas.addIcon(x: i * 2, y: i * 2, iconType: "circle")
}

let memoryUsage = canvas.getMemoryUsage()
print("Total memory usage with Flyweight pattern: \(memoryUsage) megabytes")
