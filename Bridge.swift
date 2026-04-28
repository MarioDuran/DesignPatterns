/*
Estás diseñando un sistema para reproducir contenido multimedia en una aplicación.
El contenido puede ser audio (como canciones) o video (como películas), y la reproducción
debe ser compatible con diferentes reproductores multimedia, por ejemplo VLC,
Windows Media Player, o incluso un reproductor personalizado en el futuro.

Queremos separar el tipo de contenido, es decir, la abstracción, de los reproductores
específicos, es decir, la implementación, para que ambos puedan variar independientemente.

Usaremos el patrón Bridge para lograr esta flexibilidad.

Requisitos:
Define una clase base abstracta MediaContent que use el puente hacia MediaPlayer.

*/

protocol MediaPlayer {
    func playContent(_ content: String)
}

class VLCPlayer: MediaPlayer {
    func playContent(_ content: String) {
        print("VLC reproduciendo: \(content)")
    }
}

class WindowsMediaPlayer: MediaPlayer {
    func playContent(_ content: String) {
        print("Windows Media Player reproduciendo: \(content)")
    }
}

class MediaContent {
    // TODO: Declarar la propiedad player

    // TODO: Crear el inicializador que reciba player: MediaPlayer

    // TODO: Crear el método play()
}

class AudioContent: MediaContent {
    private let title: String

    init(title: String, player: MediaPlayer) {
        self.title = title
        super.init(player: player)
    }

    override func play() {
        player.playContent("Audio: \(title)")
    }
}

class VideoContent: MediaContent {
    private let title: String

    init(title: String, player: MediaPlayer) {
        self.title = title
        super.init(player: player)
    }

    override func play() {
        player.playContent("Video: \(title)")
    }
}

let vlcPlayer = VLCPlayer()
let wmpPlayer = WindowsMediaPlayer()

let song = AudioContent(title: "Cancion Favorita", player: vlcPlayer)
let movie = VideoContent(title: "Pelicula Epica", player: wmpPlayer)

song.play()
movie.play()
