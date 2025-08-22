
import Foundation

extension URLSessionDataTask: URLSessionTaskProtocol{ }


extension URLSession: URLSessionProtocol {
    func makeDataTask(with url: URLRequest, completionHandler: @escaping (Data?, URLResponse?, (any Error)?) -> Void) -> any HomeTestNu.URLSessionTaskProtocol {
        
        return dataTask(with: url, completionHandler: completionHandler )
    }
    
}
