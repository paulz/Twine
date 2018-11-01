import Quick
import Nimble
@testable import SwiftEmail

class EmailSpec: QuickSpec {
    override func spec() {
        describe("email struct") {
            context("json parsing") {
                it("should create emails from json") {
                    let testBundle = Bundle.init(for: type(of: self))
                    let jsonUrl = testBundle.url(forResource: "twine-mail-get", withExtension: "json")!
                    let jsonData = try! Data(contentsOf: jsonUrl)
                    let decoder = JSONDecoder()
                    let list = try! decoder.decode(ListOfEmails.self, from: jsonData)
                    expect(list.emails.count) == 6

                    let firstEmail = list.emails[0]
                    expect(firstEmail.subject) == "Tahoe Trip Next Weekend"
                    expect(firstEmail.from) == "x@gmail.com"
                    expect(firstEmail.to) == ["a@gmail.com", "b@gmail.com", "c.gmail.com"]
                    expect(firstEmail.body) == "Mi augue mattis vitae erat risus nibh, mauris sodales nonummy a, vestibulum lacinia"
                    expect(firstEmail.date) == "2017-08-01T14:30Z"
                    expect(firstEmail.unread) == true
                }
            }
        }
    }
}
