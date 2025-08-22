import Foundation

public struct APIService {
    
    var session: URLSessionProtocol
    
    init(session: URLSessionProtocol) {
        self.session = session
    }
    
    func configureUrlRequest(aliasRequest: URLRequest, completion: @escaping (Result<Aliases, Error>) -> Void) {
       
        session.makeDataTask(with: aliasRequest, completionHandler: { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            
            guard let data = data else {
                completion(.failure(NetworkError.noData))
                return
            }
            
            do {
                let response = try JSONDecoder().decode(Aliases.self, from: data)
                completion(.success(response))
            }
            catch {
                completion(.failure(error))
            }
        }).resume()
    }
    
    func fetchAlias(_ completion: @escaping (Result<Aliases, Error>) -> Void) -> URLSessionTaskProtocol  {
        let request = APIEndpoint.fecthAlias.request
        return session.makeDataTask(with: request, completionHandler: {_, _, _ in })
    }
    
    
    func postAlias(_ alias: String, completion: @escaping (Result<Aliases, Error>) -> Void)  {

        var request = APIEndpoint.postAlias.request
        var requestBody: [String: String] = [:]
        requestBody["url"] = alias
        request.httpBody = try? JSONSerialization.data(withJSONObject: requestBody, options: [])
        
        configureUrlRequest(aliasRequest: request, completion: completion)
    }
    
    enum NetworkError: Error {
        case invalidURL
        case noData
    }
}
