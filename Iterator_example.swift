protocol IteratorProtocol{
    associatedtype Item
    func hasNext() -> Bool
    func next() -> Item?
}

protocol Aggregate {
    associatedtype Item
    associatedtype IteratorType: IteratorProtocol where IteratorType.Item == Item
    func createIterator() -> IteratorType
}

class ListIterator: IteratorProtocol {
    typealias Item = String
    
    private let items: [String]
    private var index: Int = 0
    
    init(items: [String]){
        self.items = items
    }
    
    func hasNext() -> Bool {
        return index < items.count
    }
    
    func next() -> String? {
        if hasNext() {
            let item = items[index]
            index += 1
            return item
        }
        
        return nil
    }
}

class ItemCollection: Aggregate {
    typealias Item = String
    typealias IteratorType = ListIterator
    
    private var items: [String] = []
    
    func addItem(_ item: String) {
        items.append(item)
    }
    
    func createIterator() -> ListIterator {
        return ListIterator(items: items)
    }
}

let collection = ItemCollection()
collection.addItem("Sócrates")
collection.addItem("Platón")
collection.addItem("Aristóteles")

var iterator = collection.createIterator()
while iterator.hasNext() {
    print(iterator.next()!)
}
