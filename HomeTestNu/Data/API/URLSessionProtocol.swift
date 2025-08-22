import Foundation

protocol URLSessionProtocol: AnyObject {
  
  func makeDataTask(
    with url: URLRequest,
    completionHandler:
      @escaping (Data?, URLResponse?, Error?) -> Void)
    -> URLSessionTaskProtocol
}

protocol URLSessionTaskProtocol: AnyObject {
  func resume()
}
