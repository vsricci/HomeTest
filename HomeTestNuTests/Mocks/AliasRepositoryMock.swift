//
//  AliasRepositoryMock.swift
//  HomeTestNu
//
//  Created by vinicius santos ricci on 22/08/25.
//

@testable import HomeTestNu
class AliasRepositoryImpMock: AliasRepositoryImp {
    
    var postAliasCalled = false
    
    override func postAlias(aliasUrlString: String, completion: @escaping (Result<Aliases, any Error>) -> Void) {
        postAliasCalled = true
    }
   
}
