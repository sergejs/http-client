import Foundation

// public typealias HTTPResult = Result<HTTPResponse, HTTPError>

public struct HTTPError: Error {
    // MARK: Lifecycle

    public init(
        code: Code,
        request: HTTPRequest,
        response: HTTPResponse? = nil,
        underlyingError: Error? = nil
    ) {
        self.code = code
        self.request = request
        self.response = response
        self.underlyingError = underlyingError
    }

    // MARK: Public

    public enum Code {
        case invalidRequest
        case serverError
        case clientError
        case invalidResponse
        case malformedResponse
        case malformedRequest
        case undableToDecode
        case unknown
    }

    public let code: Code
    public let request: HTTPRequest
    public let response: HTTPResponse?
    public let underlyingError: Error?
}

// public extension HTTPResult {
//  var request: HTTPRequest {
//    switch self {
//      case let .success(response): return response.request
//      case let .failure(error): return error.request
//    }
//  }
//
//  var response: HTTPResponse? {
//    switch self {
//      case let .success(response): return response
//      case let .failure(error): return error.response
//    }
//  }
// }
