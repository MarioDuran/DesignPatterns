import Foundation

protocol FileSystemComponent: AnyObject {
    func getSize() -> Int
    func display(indent: String)
}

final class File: FileSystemComponent {
    let name: String
    let size: Int

    init(_ name: String, _ size: Int) {
        self.name = name
        self.size = size
    }

    func getSize() -> Int {
        size
    }

    func display(indent: String = "") {
        print("\(indent)- File: \(name) (\(size)KB)")
    }
}

final class Folder: FileSystemComponent {
    let name: String
    private var components: [FileSystemComponent] = []

    init(_ name: String) {
        self.name = name
    }

    func add(_ component: FileSystemComponent) {
        components.append(component)
    }

    func remove(_ component: FileSystemComponent) {
        components.removeAll { $0 === component }
    }

    func getSize() -> Int {
        components.reduce(0) { $0 + $1.getSize() }
    }

    func display(indent: String = "") {
        print("\(indent)+ Folder: \(name) (\(getSize())KB)")
        for component in components {
            component.display(indent: indent + "  ")
        }
    }
}

let doc1 = File("documento1.txt", 50)
let doc2 = File("documento2.pdf", 200)
let img1 = File("imagen.jpg", 150)

let docsFolder = Folder("Documentos")
docsFolder.add(doc1)
docsFolder.add(doc2)

let rootFolder = Folder("Raíz")
rootFolder.add(docsFolder)
rootFolder.add(img1)

rootFolder.display()
