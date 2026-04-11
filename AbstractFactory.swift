import Foundation

// Problema: Fábrica de Dispositivos Electrónicos
//
// Una tienda de tecnología necesita un sistema para fabricar dispositivos electrónicos
// adaptados a distintos sistemas operativos.
//
// Los sistemas operativos que maneja son:
// - Android
// - iOS
//
// Cada sistema operativo debe poder fabricar dos tipos de dispositivos:
// - Teléfono
// - Tableta
//
// Especificaciones de los dispositivos:
//
// Android:
// - Teléfono: "Teléfono Android con pantalla AMOLED"
// - Tableta: "Tableta Android con stylus incluido"
//
// iOS:
// - Teléfono: "iPhone con chip A15 Bionic"
// - Tableta: "iPad con pantalla Liquid Retina"
//
// Ejercicio:
//
// 1. Crear dos interfaces o clases base llamadas Telefono y Tableta que definan
//    el método común obtenerDescripcion().
// 2. Diseñar una clase abstracta o protocolo FabricaDispositivos con dos métodos:
//    crearTelefono() y crearTableta().
// 3. Implementar dos fábricas concretas: FabricaAndroid y FabricaIOS, que creen
//    objetos específicos según el sistema operativo.
// 4. El cliente debe poder solicitar dispositivos sin conocer los detalles concretos
//    de su creación, solo utilizando la fábrica correspondiente.

// Interfaces base para productos
// TODO: Definir protocolos Telefono y Tableta con el método obtenerDescripcion()

protocol Telefono {
}

protocol Tableta {
}

// Implementaciones concretas de productos Android
class TelefonoAndroid: Telefono {
    func obtenerDescripcion() -> String {
        return "Teléfono Android con pantalla AMOLED"
    }
}

class TabletaAndroid: Tableta {
    func obtenerDescripcion() -> String {
        return "Tableta Android con stylus incluido"
    }
}

// Implementaciones concretas de productos iOS
class TelefonoIOS: Telefono {
    func obtenerDescripcion() -> String {
        return "iPhone con chip A15 Bionic"
    }
}

class TabletaIOS: Tableta {
    func obtenerDescripcion() -> String {
        return "iPad con pantalla Liquid Retina"
    }
}

// Clase abstracta de fábrica
// TODO: Definir el protocolo FabricaDispositivos con métodos crearTelefono y crearTableta

protocol FabricaDispositivos {
}

// Fábricas concretas
class FabricaAndroid: FabricaDispositivos {
    func crearTelefono() -> Telefono {
        return TelefonoAndroid()
    }

    func crearTableta() -> Tableta {
        return TabletaAndroid()
    }
}

class FabricaIOS: FabricaDispositivos {
    func crearTelefono() -> Telefono {
        return TelefonoIOS()
    }

    func crearTableta() -> Tableta {
        return TabletaIOS()
    }
}

// TODO: Función cliente
func mostrarDispositivos(fabrica: FabricaDispositivos) {
    print("Teléfono: \(telefono.obtenerDescripcion())")
    print("Tableta: \(tableta.obtenerDescripcion())")
}

// Uso del patrón
let androidFactory = FabricaAndroid()
let iosFactory = FabricaIOS()

mostrarDispositivos(fabrica: androidFactory)
mostrarDispositivos(fabrica: iosFactory)
