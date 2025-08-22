
import Foundation

enum Configuration {
    
    private enum Keys {
        static let baseUrl = "BASE_URL"
        static let apiKey = "API_KEY"
    }
    
    private static var infoDictionary: [String: Any ] = Bundle.main.infoDictionary ?? [:]
    
    static var baseUrl: String {
        return infoDictionary[Keys.baseUrl] as? String ?? ""
    }
    
    static var apiKey: String {
        return infoDictionary[Keys.apiKey] as? String ?? ""
    }
}
 
