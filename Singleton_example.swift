final class MySingleton {
    
    static let shared = MySingleton()
    var name: String = "Unique Instance"
    
    private init() {
        print("Singleton initialized")
    }
    
    func doSomething() {
        print("The Singleton is doing something with: \(name)")
    }
}

let instance1 = MySingleton.shared
let instance2 = MySingleton.shared

let address1 = Unmanaged.passUnretained(instance1).toOpaque()
let address2 = Unmanaged.passUnretained(instance2).toOpaque()

MySingleton.shared.doSomething()

print("Instance 1 address: \(address1)")
print("Instance 2 address: \(address2)")
