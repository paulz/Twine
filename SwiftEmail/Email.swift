import Foundation

public struct ListOfEmails: Codable {
    let emails: [Email]
}

public extension ListOfEmails {
    func unreadCount() -> Int {
        return 3
    }
}

public struct Email: Codable {
    let id: Int
    let subject, from: String
    let to: [String]
    let body: String
    let date: String?
    let unread: Bool
}
