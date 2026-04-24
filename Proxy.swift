/*
Completar la implementación de CachedMusicService

Requisitos:
- Almacene en caché la lista de canciones y la reutilice en solicitudes posteriores.
- Guarde la información de canciones en un diccionario y evite solicitudes repetidas al servicio real.
- Rastree las canciones reproducidas en un conjunto para evitar reproducirlas nuevamente desde el servidor.
*/

import Foundation

protocol MusicService {
    func listSongs() -> [String]
    func getSongInfo(_ songId: String) -> [String: String]
    func playSong(_ songId: String)
}

class RealMusicService: MusicService {
    func listSongs() -> [String] {
        print("Solicitando lista de canciones desde el servidor...")
        Thread.sleep(forTimeInterval: 1)
        return ["song1", "song2", "song3"]
    }

    func getSongInfo(_ songId: String) -> [String: String] {
        print("Obteniendo información de la canción \(songId) desde el servidor...")
        Thread.sleep(forTimeInterval: 1)
        return [
            "id": songId,
            "title": "Canción \(songId)",
            "artist": "Artista Desconocido"
        ]
    }

    func playSong(_ songId: String) {
        print("Reproduciendo canción \(songId) desde el servidor...")
        Thread.sleep(forTimeInterval: 1)
        print("Canción \(songId) reproducida con éxito.")
    }
}

class CachedMusicService: MusicService {
    private let service: MusicService

    init(service: MusicService) {
        self.service = service
        // TODO: Inicializar estructuras de caché
    }

    func listSongs() -> [String] {
        // TODO: Implementar caché para la lista de canciones
        return []
    }

    func getSongInfo(_ songId: String) -> [String: String] {
        // TODO: Implementar caché para la información de canciones
        return [:]
    }

    func playSong(_ songId: String) {
        // TODO: Implementar caché para canciones reproducidas
    }
}

class MusicPlayerGUI {
    private let service: MusicService

    init(service: MusicService) {
        self.service = service
    }

    func showSongList() {
        let songs = service.listSongs()
        print("Lista de canciones disponibles:")
        for song in songs {
            print(" - \(song)")
        }
    }

    func showSongDetails(_ songId: String) {
        let info = service.getSongInfo(songId)
        print("Detalles: \(info["title"] ?? "") por \(info["artist"] ?? "")")
    }

    func playSelectedSong(_ songId: String) {
        service.playSong(songId)
    }
}

let realService = RealMusicService()
let cachedService = CachedMusicService(service: realService)
let player = MusicPlayerGUI(service: cachedService)

print("\nPrimera interacción:")
player.showSongList()
player.showSongDetails("song1")
player.playSelectedSong("song1")

print("\nSegunda interacción:")
player.showSongList()
player.showSongDetails("song1")
player.playSelectedSong("song1")

print("\nTercera interacción:")
player.showSongList()
player.showSongDetails("song1")
player.playSelectedSong("song1")
