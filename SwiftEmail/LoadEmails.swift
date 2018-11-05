//
//  LoadEmails.swift
//  SwiftEmail
//
//  Created by Paul Zabelin on 11/5/18.
//  Copyright © 2018 Paul Zabelin. All rights reserved.
//

import Foundation

public func loadEmails(from bundle: Bundle) -> ListOfEmails {
    let jsonUrl = bundle.url(forResource: "twine-mail-get", withExtension: "json")!
    let jsonData = try! Data(contentsOf: jsonUrl)
    let decoder = JSONDecoder()
    let list = try! decoder.decode(ListOfEmails.self, from: jsonData)
    return list
}
