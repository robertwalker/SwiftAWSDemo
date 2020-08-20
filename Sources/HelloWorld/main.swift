import Foundation
import AWSLambdaRuntime
import AWSLambdaEvents

let jsonEncoder = JSONEncoder()
let jsonDecoder = JSONDecoder()

struct Input: Codable {
    let name: String
}

struct Output: Codable {
    let hello: String
}

Lambda.run { (context, request: APIGateway.V2.Request, callback: @escaping (Result<APIGateway.V2.Response, Error>) -> Void) in
    let response: APIGateway.V2.Response
    
    switch (request.context.http.path, request.context.http.method) {
    case ("/hello", .GET):
        do {
            let body = try jsonEncoder.encodeAsString(Output(hello: "world"))
            response = APIGateway.V2.Response(
                statusCode: .ok,
                multiValueHeaders: ["content-type": ["application/json"]],
                body: body)
        } catch {
            response = APIGateway.V2.Response(statusCode: .badRequest)
        }
    case ("/hello", .POST):
        do {
            let input = try jsonDecoder.decode(Input.self, from: request.body ?? "")
            let responseBody = Output(hello: input.name)
            let body = try jsonEncoder.encodeAsString(responseBody)
            response = APIGateway.V2.Response(
                statusCode: .ok,
                multiValueHeaders: ["content-type": ["application/json"]],
                body: body)
        }
        catch {
            response = APIGateway.V2.Response(statusCode: .badRequest)
        }
    default:
        response = APIGateway.V2.Response(statusCode: .notFound)
    }
    
    callback(.success(response))
}

extension JSONEncoder {
    func encodeAsString<T: Encodable>(_ value: T) throws -> String {
        try String(decoding: self.encode(value), as: Unicode.UTF8.self)
    }
}

extension JSONDecoder {
    func decode<T: Decodable>(_ type: T.Type, from string: String) throws -> T {
        try self.decode(type, from: Data(string.utf8))
    }
}
