//
//  ViewController.swift
//  EmailClient
//
//  Created by Paul Zabelin on 10/29/18.
//  Copyright © 2018 Paul Zabelin. All rights reserved.
//

import UIKit
import SwiftEmail

enum Sections: String {
    case Unread, Read
}

class SummaryViewController: UITableViewController {
    var emails: ListOfEmails!

    override func viewDidLoad() {
        super.viewDidLoad()
        updateUnreadCounter(emails.unreadCount())
    }

    let tableSections: [Sections] = [.Unread, .Read]

    override func numberOfSections(in tableView: UITableView) -> Int {
        return tableSections.count
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionTitle = tableSections[section].rawValue
        return "\(sectionTitle) emails".uppercased()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

extension SummaryViewController {
    func updateUnreadCounter(_ count: Int) {
        toolbarItems![0].title = "Unread count: \(count)"
    }
}
