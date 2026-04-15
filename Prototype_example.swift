import Foundation

protocol EnemyPrototype {
    func clone(deep: Bool) -> EnemyPrototype
    func display()
}

final class WeaponInfo {
    var type: String
    var damage: Int

    init(type: String, damage: Int) {
        self.type = type
        self.damage = damage
    }

    func clone() -> WeaponInfo {
        return WeaponInfo(type: type, damage: damage)
    }
}

final class Goblin: EnemyPrototype {
    var health: Int
    var weapon: WeaponInfo

    init(health: Int, weapon: WeaponInfo) {
        self.health = health
        self.weapon = weapon
    }

    func clone(deep: Bool = true) -> EnemyPrototype {
        if deep {
            return Goblin(
                health: self.health,
                weapon: self.weapon.clone()
            )
        } else {
            return Goblin(
                health: self.health,
                weapon: self.weapon
            )
        }
    }

    func display() {
        print("Goblin with \(health) HP and \(weapon.type) (\(weapon.damage) damage)")
    }
}

final class EnemySpawner {
    private let prototype: EnemyPrototype

    init(prototype: EnemyPrototype) {
        self.prototype = prototype
    }

    func spawnEnemy(deep: Bool = true) -> EnemyPrototype {
        return prototype.clone(deep: deep)
    }
}

let weaponInfo = WeaponInfo(type: "Dagger", damage: 10)
let goblinPrototype = Goblin(health: 100, weapon: weaponInfo)
let goblinSpawner = EnemySpawner(prototype: goblinPrototype)

print("\n-- Deep Copies --")
let deepEnemies = (0..<3).map { _ in goblinSpawner.spawnEnemy(deep: true) }
for enemy in deepEnemies {
    enemy.display()
}

print("\n-- Shallow Copies --")
let shallowEnemies = (0..<3).map { _ in goblinSpawner.spawnEnemy(deep: false) }
for enemy in shallowEnemies {
    enemy.display()
}

print("\n-- Modificando arma del primer goblin shallow --")
if let firstGoblin = shallowEnemies[0] as? Goblin {
    firstGoblin.weapon.damage = 99
}

for (index, enemy) in shallowEnemies.enumerated() {
    print("Goblin \(index + 1):")
    enemy.display()
}
