import Foundation

public class AliasRepositoryImp: AliasRepository {
    
    private let apiService: APIService
    
    init(apiService: APIService) {
        self.apiService = apiService
    }
    
    
// MARK: - Get alias api, could be uses in future
//    func getAlias(completion: @escaping (Result<Aliases, any Error>) -> Void) {
//        apiService.fetchAlias { result in
//            completion(result)
//        }
//    }
    
    func postAlias(aliasUrlString: String, completion: @escaping (Result<Aliases, any Error>) -> Void) {
        apiService.postAlias(aliasUrlString) { result in
            completion(result)
        }
    }
}
