//
//  DependencyInjection.swift
//  EmailClient
//
//  Created by Paul Zabelin on 11/5/18.
//  Copyright © 2018 Paul Zabelin. All rights reserved.
//

import SwinjectStoryboard
import SwinjectAutoregistration
import SwiftEmail

extension SwinjectStoryboard {
    public static func setup() {
        defaultContainer.register(ListOfEmails.self) { _ in
            loadEmails(from: Bundle.main)
        }.inObjectScope(.container)
        defaultContainer.storyboardInitCompleted(SummaryViewController.self) { r, c in
            c.emails = r~>
        }
        defaultContainer.storyboardInitCompleted(UINavigationController.self) {_,_  in}
    }
}
