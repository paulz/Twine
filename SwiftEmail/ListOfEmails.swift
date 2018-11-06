import Foundation

public class ListOfEmails: Codable {
    let emails: [Email]

    public init(emails: [Email]) {
        self.emails = emails
    }
}

public extension ListOfEmails {
    func unreadCount() -> Int {
        return emails.reduce(0) { $0 + ($1.unread ? 1 : 0) }
    }

    func readEmails() -> [Email] {
        return emails.filter{!$0.unread}
    }

    func unreadEmails() -> [Email] {
        return emails.filter{$0.unread}
    }

    func markRead(_ index: Int) {
        var unread = unreadEmails()
        unread[index].unread = false
    }
}
