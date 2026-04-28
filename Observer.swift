/*
 Patrón Observer

 El patrón Observer es un patrón de diseño de comportamiento que define
 una relación de uno a muchos entre objetos. Cuando un objeto, llamado
 sujeto, cambia su estado, todos sus objetos dependientes, llamados
 observadores, son notificados y actualizados automáticamente.

 Es útil para mantener la consistencia entre objetos relacionados sin
 acoplarlos fuertemente.

 Requisitos:

 1. Crear la clase PhoneDisplay que muestre los datos en un formato como:
    "App móvil: Temp=25.5°C, Hum=60%, Pres=1013.2hPa"

 2. Crear la clase LCDDisplay que muestre los datos en un formato como:
    "Pantalla LCD: Temperatura: 25.5°C | Humedad: 60% | Presión: 1013.2 hPa"

 3. Instanciar los observadores.

 4. Agregarlos a la estación meteorológica.
*/

import Foundation

protocol WeatherObserver: AnyObject {
    func update(temperature: Double, humidity: Double, pressure: Double)
}

final class WeatherStation {
    private var observers: [WeatherObserver] = []

    private var temperature: Double = 0.0
    private var humidity: Double = 0.0
    private var pressure: Double = 0.0

    func attach(_ observer: WeatherObserver) {
        observers.append(observer)
    }

    func detach(_ observer: WeatherObserver) {
        observers.removeAll { $0 === observer }
    }

    func notify() {
        for observer in observers {
            observer.update(
                temperature: temperature,
                humidity: humidity,
                pressure: pressure
            )
        }
    }

    func setMeasurements(temperature: Double, humidity: Double, pressure: Double) {
        self.temperature = temperature
        self.humidity = humidity
        self.pressure = pressure
        notify()
    }
}

// TODO: Crear la clase PhoneDisplay

// TODO: Crear la clase LCDDisplay

let weatherStation = WeatherStation()

// TODO: Instanciar los observadores

// TODO: Agregar los observadores a la estación meteorológica

weatherStation.setMeasurements(
    temperature: 25.5,
    humidity: 60,
    pressure: 1013.2
)
