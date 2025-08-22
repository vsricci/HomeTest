//
//  AliasUseCaseTests.swift
//  HomeTestNu
//
//  Created by vinicius santos ricci on 22/08/25.
//

@testable import HomeTestNu
import XCTest

class AliasUseCaseMock: AliasUseCase {
    
    var postAliasCalled = false
    
    override func postAlias(aliasdUrlString: String, completion: @escaping (Result<Aliases, any Error>) -> Void) {
        postAliasCalled = true
    }
}
