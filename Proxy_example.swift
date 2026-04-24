import Foundation

protocol TikTokService {
    func listVideos() -> [String]
    func getVideoInfo(_ videoId: String) -> [String: String]
    func downloadVideo(_ videoId: String)
}

class RealTikTokService: TikTokService {
    func listVideos() -> [String] {
        print("Solicitando lista de videos desde TikTok...")
        Thread.sleep(forTimeInterval: 1)
        return ["videoA", "videoB", "videoC"]
    }

    func getVideoInfo(_ videoId: String) -> [String: String] {
        print("Obteniendo información del video \(videoId) desde TikTok...")
        Thread.sleep(forTimeInterval: 1)
        return ["id": videoId, "title": "Título del video \(videoId)"]
    }

    func downloadVideo(_ videoId: String) {
        print("Descargando video \(videoId) desde TikTok...")
        Thread.sleep(forTimeInterval: 1)
    }
}

class CachedTikTokService: TikTokService {
    private let service: TikTokService
    private var listCache: [String]?
    private var videoCache: [String: [String: String]]
    private var downloadedVideos: Set<String>

    init(service: TikTokService) {
        self.service = service
        self.listCache = nil
        self.videoCache = [:]
        self.downloadedVideos = []
    }

    func listVideos() -> [String] {
        if listCache == nil {
            print("Actualizando caché de lista de videos...")
            listCache = service.listVideos()
        } else {
            print("Usando caché de lista de videos (sin retardo)...")
        }

        return listCache!
    }

    func getVideoInfo(_ videoId: String) -> [String: String] {
        if videoCache[videoId] == nil {
            print("Actualizando caché del video \(videoId)...")
            videoCache[videoId] = service.getVideoInfo(videoId)
        } else {
            print("Usando caché del video \(videoId) (sin retardo)...")
        }

        return videoCache[videoId]!
    }

    func downloadVideo(_ videoId: String) {
        if !downloadedVideos.contains(videoId) {
            print("Descargando video \(videoId) (no estaba en caché)...")
            service.downloadVideo(videoId)
            downloadedVideos.insert(videoId)
        } else {
            print("El video \(videoId) ya fue descargado (sin retardo).")
        }
    }
}

class TikTokGUI {
    private let service: TikTokService

    init(service: TikTokService) {
        self.service = service
    }

    func renderVideoPage(_ videoId: String) {
        let info = service.getVideoInfo(videoId)
        print("Renderizando página del video: \(info["title"]!)")
    }

    func renderListPanel() {
        let videos = service.listVideos()
        print("Renderizando panel de videos:")
        for video in videos {
            print(" - Miniatura de \(video)")
        }
    }

    func reactOnUserInput() {
        renderListPanel()
        renderVideoPage("videoA")
        service.downloadVideo("videoA")
    }
}

let tiktokDirect = RealTikTokService()
let managerDirect = TikTokGUI(service: tiktokDirect)
managerDirect.reactOnUserInput()
managerDirect.reactOnUserInput()
managerDirect.reactOnUserInput()

print("\n=== Usando proxy (la primera vez tarda, luego es instantáneo) ===")
let tiktokProxy = CachedTikTokService(service: RealTikTokService())
let managerCached = TikTokGUI(service: tiktokProxy)

print("\nPrimera solicitud (se llena la caché):")
managerCached.reactOnUserInput()
managerCached.reactOnUserInput()
managerCached.reactOnUserInput()
