typealias Request = [String: Any]

class Handler {
    private var nextHandler: Handler?

    @discardableResult
    func setNext(_ handler: Handler) -> Handler {
        self.nextHandler = handler
        return handler
    }

    func handle(_ request: Request) -> String {
        fatalError("Este método debe ser sobrescrito")
    }

    func handleNext(_ request: Request, successMessage: String) -> String {
        if let nextHandler = nextHandler {
            return nextHandler.handle(request)
        }

        return successMessage
    }
}

final class AuthHandler: Handler {
    override func handle(_ request: Request) -> String {
        guard let authenticated = request["authenticated"] as? Bool, authenticated else {
            return "Error: Usuario no autenticado"
        }

        return handleNext(request, successMessage: "Autenticación exitosa")
    }
}

final class RoleHandler: Handler {
    override func handle(_ request: Request) -> String {
        guard let role = request["role"] as? String, role == "admin" else {
            return "Error: Usuario no autorizado"
        }

        return handleNext(request, successMessage: "Acceso autorizado")
    }
}

final class PermissionHandler: Handler {
    override func handle(_ request: Request) -> String {
        let permissions = request["permissions"] as? [String] ?? []

        guard permissions.contains("write") else {
            return "Error: Permiso insuficiente"
        }

        return handleNext(request, successMessage: "Permiso concedido")
    }
}

func clientCode(handler: Handler, request: Request) {
    let result = handler.handle(request)
    print(result)
}

let authHandler = AuthHandler()
let roleHandler = RoleHandler()
let permissionHandler = PermissionHandler()

authHandler
    .setNext(roleHandler)
    .setNext(permissionHandler)

let request: Request = [
    "authenticated": true,
    "role": "admin",
    "permissions": ["read", "write"]
]

clientCode(handler: authHandler, request: request)
