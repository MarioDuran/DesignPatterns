import Foundation

class DVDPlayer {
    func on() {
        print("DVD Player encendido")
    }

    func play(movie: String) {
        print("Reproduciendo película: \(movie)")
    }

    func stop() {
        print("DVD Player detenido")
    }

    func off() {
        print("DVD Player apagado")
    }
}

class Amplificador {
    func on() {
        print("Amplificador encendido")
    }

    func setVolume(level: Int) {
        print("Volumen establecido en \(level)")
    }

    func off() {
        print("Amplificador apagado")
    }
}

class Proyector {
    func on() {
        print("Proyector encendido")
    }

    func setInput(input: String) {
        print("Entrada del proyector establecida en \(input)")
    }

    func off() {
        print("Proyector apagado")
    }
}

class HomeTheaterFacade {
    private let dvd: DVDPlayer
    private let amp: Amplificador
    private let proyector: Proyector

    init() {
        self.dvd = DVDPlayer()
        self.amp = Amplificador()
        self.proyector = Proyector()
    }

    func watchMovie(movie: String) {
        print("\nPreparando para ver una película...")
        amp.on()
        amp.setVolume(level: 5)
        proyector.on()
        proyector.setInput(input: "DVD")
        dvd.on()
        dvd.play(movie: movie)
    }

    func endMovie() {
        print("\nApagando el sistema de cine...")
        dvd.stop()
        dvd.off()
        proyector.off()
        amp.off()
    }
}

let homeTheater = HomeTheaterFacade()
homeTheater.watchMovie(movie: "Shrek")
homeTheater.endMovie()
