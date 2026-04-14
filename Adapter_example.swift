protocol WeatherService {
    func getTemperature(city: String) -> Double
}

class LocalWeatherService: WeatherService {
    func getTemperature(city: String) -> Double {
        print("Obteniendo clima de base de datos para \(city)...")
        return 22.5
    }
}

func showTemperature(service: WeatherService, city: String) {
    let temp = service.getTemperature(city: city)
    print("La temperatura en \(city) es \(temp)°C")
}

let localService = LocalWeatherService()
showTemperature(service: localService, city: "Monterrey")

class ExternalWeatherAPI {
    func fetchWeather(location: String) -> [String: Any] {
        print("Llamando a API externa para \(location)...")
        return ["temp_celsius": 24.0, "status": "sunny"]
    }
}

class ExternalWeatherAdapter: WeatherService {
    private let externalAPI: ExternalWeatherAPI

    init(externalAPI: ExternalWeatherAPI) {
        self.externalAPI = externalAPI
    }

    func getTemperature(city: String) -> Double {
        let data = externalAPI.fetchWeather(location: city)
        return data["temp_celsius"] as? Double ?? 0.0
    }
}

let externalAPI = ExternalWeatherAPI()
let adaptedService = ExternalWeatherAdapter(externalAPI: externalAPI)
showTemperature(service: adaptedService, city: "Guadalajara")
