import Foundation

enum APIEndpoint {
    case fecthAlias
    case postAlias
    
    enum HTTPMethod: String {
        case get = "GET"
        case put
        case post = "POST"
        case delete
    }
    
    private var httpMethod: HTTPMethod {
        switch self {
        case .fecthAlias:
            return .get
        case .postAlias:
            return .post
        }
    }
    
    private var url: URL {
        URL(string: Configuration.baseUrl)!
    }
    
    typealias Headers = [String: String]
    
    private var headers: Headers {
        ["Content-Type": "application/json"]
    }
    
    var request: URLRequest {
        var request =  URLRequest(url: url)
        
        request.addHeaders(headers)
        request.httpMethod = httpMethod.rawValue
        
        return request
    }
}

extension URLRequest {
    mutating func addHeaders(_ headers: APIEndpoint.Headers) {
        headers.forEach { header, value in
            addValue(value, forHTTPHeaderField: header)
        }
    }
}
