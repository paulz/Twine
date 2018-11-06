//
//  LoadEmails.swift
//  SwiftEmail
//
//  Created by Paul Zabelin on 11/5/18.
//  Copyright © 2018 Paul Zabelin. All rights reserved.
//

import Foundation

public func jsonDateFormatter() -> DateFormatter {
    let formatter = DateFormatter()
    formatter.dateFormat = "yyyy-MM-dd'T'HH:mmZZZZZ"
    formatter.calendar = Calendar(identifier: .iso8601)
    formatter.timeZone = TimeZone(identifier: "GMT")
    formatter.locale = Locale(identifier: "en_US_POSIX")
    return formatter
}

public func loadEmails(from bundle: Bundle) -> ListOfEmails {
    let jsonUrl = bundle.url(forResource: "twine-mail-get", withExtension: "json")!
    let jsonData = try! Data(contentsOf: jsonUrl)
    let decoder = JSONDecoder()
    decoder.dateDecodingStrategy = .formatted(jsonDateFormatter())
    let list = try! decoder.decode(ListOfEmails.self, from: jsonData)
    return list
}
