import Quick
import Nimble

class FirstSpec: QuickSpec {
    override func spec() {
        describe("first spec") {
            it("should work") {
                expect(1 + 1) == 2
            }
        }
    }
}
