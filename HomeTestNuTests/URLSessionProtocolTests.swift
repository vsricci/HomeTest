

@testable import HomeTestNu
import XCTest

class URLSessionProtocolTests: XCTestCase {
    var session: URLSession!
    var url: URL!
    var request: URLRequest!
    
    
  override func setUp() {
    super.setUp()
    
    url = URL(string: "https://example.com")!
    request = URLRequest(url: url)
    session = URLSession(configuration: .default)
  }
  
  override func tearDown() {
    session = nil
    super.tearDown()
  }
      
  func test_URLSessionTask_conformsTo_URLSessionTaskProtocol() {
        // given
    let url = URL(string: "https://example.com")!
        
        // when
    let task = session.dataTask(with: url)
        
    // then
    XCTAssertTrue((task as AnyObject) is URLSessionTaskProtocol)
  }
    
  func test_URLSession_makeDataTask_createsTaskWithPassedInURL() {
      // given
   
    let url = URL(string: "https://example.com")!
    let request = URLRequest(url: url)
      // when
      let task = session.dataTask(
        with: request,
        completionHandler: { _, _, _ in })
    as! URLSessionTask

      // then
    XCTAssertEqual(task.originalRequest?.url, url)
  }
    
    func test_URLSession_makeDataTask_createsTaskWithPassedInCompletion() {
        // given
        let expectation =
        expectation(description: "Completion should be called")
        
        // when
        let task = session.dataTask(
            with: request,
            completionHandler: { _, _, _ in expectation.fulfill() })
        as! URLSessionTask
        task.cancel()
        
        // then
        waitForExpectations(timeout: 0.2, handler: nil)
    }
}
