import Foundation

public struct Email: Codable {
    public let id: Int
    public let subject, from: String
    public let to: [String]
    public let body: String
    public let date: String?
    public let unread: Bool
}
