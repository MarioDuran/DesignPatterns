/*
Ejercicio: Reproductor de Música con Patrón Iterator

Descripción:
El objetivo de este ejercicio es implementar el patrón Iterator para crear un reproductor de música que permita recorrer una lista de canciones de manera secuencial sin exponer la estructura interna de la colección.

El patrón Iterator permitirá al reproductor avanzar a la siguiente canción o verificar si hay más canciones disponibles, ofreciendo una forma flexible y reutilizable de recorrer la colección.

Requisitos:
- Implementar un protocolo Iterator con métodos hasNext() y next().
- Implementar un protocolo Aggregate con un método createIterator().
- Crear una clase PlaylistIterator que implemente la lógica para recorrer las canciones con hasNext() y next().
- Escribir un cliente que cree una lista de reproducción, añada al menos tres canciones y use el iterador para reproducirlas en orden, imprimiendo cada canción.
- Modificar canciones para agregar sus canciones favoritas
*/

import Foundation

// TODO Implementar un protocolo Iterator con métodos hasNext() y next().
protocol Iterator {
    
}

// TODO Implementar un protocolo Aggregate con un método createIterator().
protocol Aggregate {
    
}

// Clase concreta para la lista de reproducción
class Playlist: Aggregate {
    private var songs: [String] = []

    func addSong(_ song: String) {
        songs.append(song)
    }

    func createIterator() -> PlaylistIterator {
        return PlaylistIterator(songs: songs)
    }
}

// TODO Crear una clase PlaylistIterator que implemente la lógica
// para recorrer las canciones con hasNext() y next().

class PlaylistIterator: Iterator {
    private let songs: [String]
    private var index: Int = 0

    init(songs: [String]) {
        self.songs = songs
    }

    func hasNext() -> Bool {
        fatalError("TODO")
    }

    func next() -> String? {
        fatalError("TODO")
    }
}

let playlist = Playlist()
playlist.addSong("Canción 1 - Artista A")
playlist.addSong("Canción 2 - Artista B")
playlist.addSong("Canción 3 - Artista C")

let iterator = playlist.createIterator()

print("Reproduciendo lista de reproducción:")
while iterator.hasNext() {
    if let song = iterator.next() {
        print("Ahora suena: \(song)")
    }
}
