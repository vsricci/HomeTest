import Foundation

protocol AliasRepository {
    //MARK: -- Get Alias APi
  //  func getAlias(completion: @escaping (Result<Aliases, Error>) -> Void)
    func postAlias(aliasUrlString: String, completion: @escaping (Result<Aliases, Error>) -> Void)
}
