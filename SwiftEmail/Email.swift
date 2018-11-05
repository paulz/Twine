import Foundation

public struct Email: Codable {
    let id: Int
    let subject, from: String
    let to: [String]
    let body: String
    let date: String?
    let unread: Bool
}
