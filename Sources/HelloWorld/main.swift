import Foundation
import AWSLambdaRuntime
import AWSLambdaEvents

let jsonEncoder = JSONEncoder()
let jsonDecoder = JSONDecoder()

struct Input: Codable {
  let number: Double
}

struct Output: Codable {
  let result: Double
}

Lambda.run { (context, request: APIGateway.V2.Request, callback: @escaping (Result<APIGateway.V2.Response, Error>) -> Void) in
  callback(.success(APIGateway.V2.Response(statusCode: .ok, body: "Hello World")))

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
