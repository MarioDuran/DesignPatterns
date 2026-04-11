import Foundation

// Problema: Builder
//
// Una aplicación necesita construir solicitudes HTTP de forma flexible.
// Cada solicitud puede configurarse paso a paso según las necesidades del cliente.
//
// Una solicitud HTTP puede incluir:
//
// - URL
// - Método HTTP (GET, POST, PUT, DELETE)
// - Headers
// - Query parameters
// - Body
//
// Ejercicio:
//
// Implementa el patrón Builder para permitir la construcción paso a paso
// de objetos HTTPRequest.
//
// Requisitos:
//
// 1. Implementar una clase HTTPRequestBuilder que permita establecer cada
//    componente por separado con métodos tipo setURL, setMethod,
//    addHeader, addQueryParameter y setBody.
// 2. Cada método del builder debe devolver self para permitir llamadas encadenadas.
// 3. El método build() debe construir y retornar el objeto final.
// 4. El cliente debe poder construir un request personalizado o usar
//    un Director para configuraciones estándar.
//

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

class HTTPRequest: CustomStringConvertible {
    var url: String?
    var method: HTTPMethod?
    var headers: [String: String]
    var queryParameters: [String: String]
    var body: String?

    init(
        url: String? = nil,
        method: HTTPMethod? = nil,
        headers: [String: String] = [:],
        queryParameters: [String: String] = [:],
        body: String? = nil
    ) {
        self.url = url
        self.method = method
        self.headers = headers
        self.queryParameters = queryParameters
        self.body = body
    }

    var description: String {
        return """
        HTTPRequest(
          url: \(url ?? "nil"),
          method: \(method?.rawValue ?? "nil"),
          headers: \(headers),
          queryParameters: \(queryParameters),
          body: \(body ?? "nil")
        )
        """
    }
}

// TODO: Implementa la clase HTTPRequestBuilder que permita construir paso a paso un request.
// Debe contener:
// - Métodos setURL, setMethod, addHeader, addQueryParameter y setBody
//   que configuren cada parte y devuelvan self para permitir llamadas encadenadas.
// - Un método build() que retorne el objeto HTTPRequest ya configurado.

class HTTPRequestBuilder {
    private var request = HTTPRequest()

    func setURL(_ url: String) -> HTTPRequestBuilder {
        return self
    }

    func setMethod(_ method: HTTPMethod) -> HTTPRequestBuilder {
        return self
    }

    func addHeader(_ key: String, _ value: String) -> HTTPRequestBuilder {
        return self
    }

    func addQueryParameter(_ key: String, _ value: String) -> HTTPRequestBuilder {
        return self
    }

    func setBody(_ body: String) -> HTTPRequestBuilder {
        return self
    }

    func build() -> HTTPRequest {
        return nil
    }
}

class HTTPRequestDirector {
    let builder: HTTPRequestBuilder

    init(builder: HTTPRequestBuilder) {
        self.builder = builder
    }

    func buildSimpleGetRequest() -> HTTPRequest {
        return builder
            .setURL("https://api.example.com/products")
            .setMethod(.get)
            .addHeader("Accept", "application/json")
            .build()
    }

    func buildSearchRequest() -> HTTPRequest {
        return builder
            .setURL("https://api.example.com/products/search")
            .setMethod(.get)
            .addHeader("Accept", "application/json")
            .addQueryParameter("q", "laptop")
            .addQueryParameter("limit", "10")
            .build()
    }

    func buildCreateUserRequest() -> HTTPRequest {
        return builder
            .setURL("https://api.example.com/users")
            .setMethod(.post)
            .addHeader("Content-Type", "application/json")
            .addHeader("Authorization", "Bearer TOKEN")
            .setBody("""
            {
              "name": "Mario",
              "email": "mario@example.com"
            }
            """)
            .build()
    }
}

let builder = HTTPRequestBuilder()

let customRequest = builder
    .setURL("https://api.example.com/orders")
    .setMethod(.post)
    .addHeader("Content-Type", "application/json")
    .addHeader("Authorization", "Bearer ABC123")
    .addQueryParameter("draft", "true")
    .setBody("""
    {
      "productId": 101,
      "quantity": 2
    }
    """)
    .build()

print(customRequest)

let director = HTTPRequestDirector(builder: HTTPRequestBuilder())

let simpleGet = director.buildSimpleGetRequest()
print(simpleGet)

let searchRequest = director.buildSearchRequest()
print(searchRequest)

let createUserRequest = director.buildCreateUserRequest()
print(createUserRequest)
