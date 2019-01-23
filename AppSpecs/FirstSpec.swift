import Quick
import Nimble
import Siesta
import SwiftEmail

class FirstSpec: QuickSpec {
    override func spec() {
        describe("network") {
            context("get list of emails") {
                // https://s3.us-east-2.amazonaws.com/twine-public/apis/twine-mail-get.json
                it("should be valid JSON") {
                    let service = Service(baseURL: "https://s3.us-east-2.amazonaws.com/twine-public/apis/", standardTransformers: [.text, .image], networking: URLSessionConfiguration.default)
                    let decoder = JSONDecoder()
                    decoder.dateDecodingStrategy = .formatted(jsonDateFormatter())
                    service.configureTransformer("twine-mail-get.json") {
                        try decoder.decode(ListOfEmails.self, from: $0.content)
                    }
                    let mailResouce = service.resource("twine-mail-get.json")
                    waitUntil(timeout: 10) { done in
                        mailResouce.addObserver(owner: self) { (resource, event) in
                            if case .newData(let data) = event {
                                print(data)
                                done()
                            }
                            print(resource)
                            print(event)
                        }
                        mailResouce.loadIfNeeded()
                    }
                    print(mailResouce.latestData!)
                    print(mailResouce.latestData!.content)
                    print(type(of: mailResouce.latestData!.content))
                    print(mailResouce.latestError ?? "no error")
                    if let content = mailResouce.latestData?.content as? ListOfEmails {
                        print("content:", content)
                    }
                    print(mailResouce)
                }
            }
        }
    }
}
