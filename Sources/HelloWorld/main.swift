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
    guard request.context.http.method == .POST, request.context.http.path == "/hello" else {
        return callback(.success(APIGateway.V2.Response(statusCode: .notFound)))
    }
    
    do {
        let input = try jsonDecoder.decode(Input.self, from: request.body ?? "")
        let responseBody = Output(hello: input.name)
        let body = try jsonEncoder.encodeAsString(responseBody)
        callback(.success(APIGateway.V2.Response(
            statusCode: .ok,
            multiValueHeaders: ["content-type": ["application/json"]],
            body: body)))
    }
    catch {
        callback(.success(APIGateway.V2.Response(statusCode: .badRequest)))
    }
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
