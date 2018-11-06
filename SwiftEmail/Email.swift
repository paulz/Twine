import Foundation

public struct Email: Codable {
    public let id: Int
    public let subject, from: String
    public let to: [String]
    public let body: String
    public let date: Date?
    public let unread: Bool

    static let displayDateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        return formatter
    }()
}

extension Email {
    public func display(in view: UIView) {
        (view.viewWithTag(1) as! UILabel).text = subject
        (view.viewWithTag(2) as! UILabel).text = to.joined(separator: ", ")
        (view.viewWithTag(3) as! UILabel).text = date == nil ? "" : Email.displayDateFormatter.string(from: date!)
        (view.viewWithTag(4) as! UILabel).text = body
    }
}
