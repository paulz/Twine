import Quick
import Nimble
@testable import SwiftEmail

class ListOfEmailsSpec: QuickSpec {
    override func spec() {
        describe("ListOfEmails") {
            let readEmail = Email(id: 1, unread: false)
            let unreadEmail = Email(id: 2, unread: true)
            let emails = ListOfEmails(emails: [readEmail, unreadEmail])

            context("readEmails") {
                it("should return read emails") {
                    expect(emails.readEmails().count) == 1
                    expect(emails.readEmails().first!.id) == 1
                }
            }

            context("unreadEmails") {
                it("should return unread emails") {
                    expect(emails.unreadEmails().count) == 1
                    expect(emails.unreadEmails().first!.id) == 2
                }
            }

            context("unread count") {
                context("no emails") {
                    it("should be 0") {
                        expect(ListOfEmails(emails: []).unreadCount()) == 0
                    }
                }

                context("1 unread email") {
                    it("should be 1") {
                        expect(emails.unreadCount()) == 1
                    }
                }
            }

            context("mark read") {
                it("should change from unread to read") {
                    emails.markRead(0)
                    expect(emails.unreadEmails().count) == 0
                    expect(emails.readEmails().count) == 2
                }
            }
        }
    }
}
