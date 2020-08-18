import AWSLambdaRuntime
import AWSLambdaEvents

struct Input: Codable {
  let number: Double
}

struct Output: Codable {
  let result: Double
}

Lambda.run { (context, request: APIGateway.V2.Request, callback: @escaping (Result<APIGateway.V2.Response, Error>) -> Void) in
  callback(.success(APIGateway.V2.Response(statusCode: .ok, body: "Hello World")))
}
