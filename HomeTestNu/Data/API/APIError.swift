enum APIError: Error {

    // MARK: - Cases

    case unknown
    case unreachable
    case failedRequest
    case invalidResponse

    // MARK: - Properties

    var message: String {
        switch self {
        case .unreachable:
            return "You need to have a network connection."
        case .unknown,
                .failedRequest,
                .invalidResponse:
            return "The list of episodes could not be fetched."
        }
    }

}
