import Foundation

class AliasUseCase {
     private let repository: AliasRepository
    
    init(repository: AliasRepository) {
        self.repository = repository
    }
    
    //MARK: -- Get Alias api 
//    func fetchAlias(completion: @escaping(Result<Aliases, Error>) -> Void) {
//        repository.getAlias { result in
//            completion(result)
//        }
//    }
    
    func postAlias(aliasdUrlString: String, completion: @escaping(Result<Aliases, Error>) -> Void) {
        repository.postAlias(aliasUrlString: aliasdUrlString) { result in
            completion(result)
        }
    }
}
