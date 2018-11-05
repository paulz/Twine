import Foundation

public struct ListOfEmails: Codable {
    let emails: [Email]
}

public extension ListOfEmails {
    func unreadCount() -> Int {
        return emails.reduce(0) { $0 + ($1.unread ? 1 : 0) }
    }

    func readEmails() -> [Email] {
        return emails
    }
}
