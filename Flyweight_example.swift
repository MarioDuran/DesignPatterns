final class TreeType {
    let species: String
    let color: String
    let textureData: [Int]

    init(species: String, color: String, textureData: [Int]) {
        self.species = species
        self.color = color
        self.textureData = textureData
    }

    func render(x: Int, y: Int) {
        print("Rendering a \(color) \(species) tree at (\(x), \(y))")
    }
}

struct Tree {
    let x: Int
    let y: Int
    let treeType: TreeType

    func plant() {
        treeType.render(x: x, y: y)
    }
}

struct TreeTypeKey: Hashable {
    let species: String
    let color: String
}

final class TreeFactory {
    private var treeTypes: [TreeTypeKey: TreeType] = [:]

    func getTreeType(species: String, color: String) -> TreeType {
        let key = TreeTypeKey(species: species, color: color)

        if let existingTreeType = treeTypes[key] {
            return existingTreeType
        }

        let textureData = Array(repeating: 0, count: 1000)
        let treeType = TreeType(
            species: species,
            color: color,
            textureData: textureData
        )

        treeTypes[key] = treeType
        return treeType
    }
}

final class Forest {
    private var trees: [Tree] = []
    private let treeFactory = TreeFactory()

    func plantTree(x: Int, y: Int, species: String, color: String) {
        let treeType = treeFactory.getTreeType(species: species, color: color)
        let tree = Tree(x: x, y: y, treeType: treeType)
        trees.append(tree)
    }
}

let forest = Forest()

for i in 0..<1000 {
    forest.plantTree(x: i, y: i, species: "Oak", color: "Green")
    forest.plantTree(x: i * 2, y: i * 2, species: "Pine", color: "Dark Green")
}
