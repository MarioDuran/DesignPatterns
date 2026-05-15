/*
Imagina que estás desarrollando un sistema de revisión de contenido para una plataforma.

Antes de que un artículo se publique, debe pasar por varias etapas de validación:

1. Comprobar si contiene lenguaje ofensivo.
2. Comprobar si supera un límite de longitud permitido.
3. Comprobar si el usuario tiene el nivel de reputación suficiente para publicar artículos largos.

Requisitos:

Implemente una cadena de responsabilidad donde cada handler sea un validador de contenido.

Los validadores necesarios son:

1. Un validador de lenguaje ofensivo, que rechaza el contenido si detecta palabras prohibidas.
2. Un validador de longitud, que rechaza textos que excedan los 5000 caracteres.
3. Un validador de reputación del usuario, que exige al menos 100 puntos de reputación si el artículo tiene más de 3000 caracteres.

El objetivo es configurar correctamente la cadena de validadores para que una solicitud pase por cada etapa antes de ser aprobada.
*/

struct ContentRequest {
    let content: String
    let reputation: Int
}

class Handler {
    private var nextHandler: Handler?

    func setNext(_ handler: Handler) -> Handler {
        self.nextHandler = handler
        return handler
    }

    func handle(_ request: ContentRequest) -> String {
        if let nextHandler = nextHandler {
            return nextHandler.handle(request)
        }

        return "Contenido aprobado."
    }
}

class OffensiveLanguageValidator: Handler {
    override func handle(_ request: ContentRequest) -> String {
        let offensiveWords = ["estólido", "estulto", "frenastético"]
        let content = request.content.lowercased()

        if offensiveWords.contains(where: { content.contains($0) }) {
            return "Error: El contenido contiene lenguaje ofensivo."
        }

        return super.handle(request)
    }
}

class LengthValidator: Handler {
    override func handle(_ request: ContentRequest) -> String {
        let content = request.content

        if content.count > 5000 {
            return "Error: El contenido excede el límite de longitud permitido."
        }

        return super.handle(request)
    }
}

class ReputationValidator: Handler {
    override func handle(_ request: ContentRequest) -> String {
        let content = request.content
        let reputation = request.reputation

        if content.count > 3000 && reputation < 100 {
            return "Error: Reputación insuficiente para publicar textos largos."
        }

        return super.handle(request)
    }
}

func clientCode(handler: Handler, request: ContentRequest) {
    let result = handler.handle(request)
    print(result)
}

// TODO: Configurar la cadena de responsabilidad.
// Debe crear las instancias de los validadores:
// - OffensiveLanguageValidator
// - LengthValidator
// - ReputationValidator
//
// Luego debe enlazarlos usando setNext(_:) en el siguiente orden:
// 1. Validador de lenguaje ofensivo
// 2. Validador de longitud
// 3. Validador de reputación

let request = ContentRequest(
    content: "Este es un artículo de prueba que no contiene palabras prohibidas y no es demasiado largo.",
    reputation: 85
)

// TODO: Ejecutar clientCode usando el primer validador de la cadena.
