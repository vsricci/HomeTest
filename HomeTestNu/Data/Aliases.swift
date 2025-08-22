import Foundation

struct Aliases: Identifiable, Codable {
    var id: Int?
    let alias: String
    let _links: Links
    
    enum CodsdingKeys: String, CodingKey {
        case alias
        case links = "_links"
    }
}

struct Links:  Codable {
    let alias: String
    let short: String
    
    enum CodingKeys: String, CodingKey {
        case alias = "self"
        case short
    }
}

struct AliasResponse: Codable {
    var alias: [Aliases]
}
