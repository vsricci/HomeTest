
import XCTest
@testable import HomeTestNu

class AliasServiceTests: XCTestCase {
    
    var endpoint: APIEndpoint!
    var sut: APIService!
    var mockSession: MockURLSession!
    
    func test_init_sets_baseURL() {
        endpoint = APIEndpoint.fecthAlias
        let url = endpoint.request.url
        let baseURL = URL(string: "https:www.google.com")!
        XCTAssertEqual(url, baseURL)
    }
    
    func  test_init_sets_session() {
        // given
        mockSession = MockURLSession()
        
        // when
        sut = APIService(session: mockSession)
       
        XCTAssertEqual(sut.session === mockSession, true)
      }
    
    func test_getAlias_callsExpectedURL() {
      // given
        let baseURL = URL(string: "https:www.google.com")!
      let getAliasUrl = URL(string: "alias", relativeTo: baseURL)!

      // when
        let mockTask = sut.fetchAlias({ result in
            
        }) as! MockURLSessionTask
        
        // then
        XCTAssertEqual(mockTask.url, getAliasUrl)
    }
}
