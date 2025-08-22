//
//  AliasViewModelTests.swift
//  HomeTestNu
//
//  Created by vinicius santos ricci on 22/08/25.
//

import XCTest
@testable import HomeTestNu


class AliasViewModelTests: XCTestCase {
    
    var service: APIService!
    var aliasUseCase: AliasUseCaseMock!
    var repository: AliasRepositoryImpMock!
    var sut: AliasListViewModel!
    
    
    override func setUp() {
        super.setUp()
        service = APIService(session: MockURLSession())
        repository = AliasRepositoryImpMock(apiService: service)
        aliasUseCase = AliasUseCaseMock(repository: repository)
        sut = AliasListViewModel(aliasUseCase: aliasUseCase)
    }

    //MARK: -- Not a great test
    func test_callApi() {
        sut.searchText = "https://jsonplaceholder.typicode.com/posts/1"
        sut.postAlias(aliasUrlString: sut.searchText)
        XCTAssertTrue(sut.listAlias.alias.isEmpty)
    }
    
    override func tearDown() {
        service = nil
        aliasUseCase = nil
        repository = nil
        sut = nil
        super.tearDown()
    }
    
}
