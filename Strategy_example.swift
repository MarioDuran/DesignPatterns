protocol ShootStrategy {
    func shoot() -> String
}

class BlueShot: ShootStrategy {
    func shoot() -> String {
        return "Blue shot"
    }
}

class RedShot: ShootStrategy {
    func shoot() -> String {
        return "Red shot"
    }
}

class GreenShot: ShootStrategy {
    func shoot() -> String {
        return "Green shot"
    }
}

class Spaceship {
    private var shootStrategy: ShootStrategy
    
    init(shootStrategy: ShootStrategy) {
        self.shootStrategy = shootStrategy
    }
    
    func setShootStrategy(_ shootStrategy: ShootStrategy) {
        self.shootStrategy = shootStrategy
    }
    
    func attack() -> String {
        return shootStrategy.shoot()
    }
}


let spaceship = Spaceship(shootStrategy: BlueShot())
print(spaceship.attack())

print("Power up")

spaceship.setShootStrategy(RedShot())
print(spaceship.attack())
