import Quick
import Nimble
@testable import SwiftEmail

class ListOfEmailsSpec: QuickSpec {
    override func spec() {
        describe("ListOfEmails") {
            context("unread count") {
                context("no emails") {
                    let emails = ListOfEmails(emails: [])

                    it("should be 0") {
                        expect(emails.unreadCount()) == 0
                    }
                }

                context("1 unread email") {
                    let email = Email(id: 0, subject: "", from: "", to: [], body: "", date: nil, unread: true)
                    let emails = ListOfEmails(emails: [email])

                    it("should be 1") {
                        expect(emails.unreadCount()) == 1
                    }
                }
            }
        }
    }
}
