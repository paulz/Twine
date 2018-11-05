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
        switch tableSections[section] {
        case .Read:
            return emails.readEmails().count
        case .Unread:
            return 1
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let section = tableSections[indexPath.section]
        let cellType = "\(section.rawValue) Emails Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellType)!
        if section == .Read {
            cell.configure(email: emails.readEmails()[indexPath.row])
        }
        return cell
    }
}

extension SummaryViewController {
    func updateUnreadCounter(_ count: Int) {
        toolbarItems![0].title = "Unread count: \(count)"
    }
}

extension UITableViewCell {
    func configure(email: Email) {
        let subjectLabel = viewWithTag(1) as! UILabel
        subjectLabel.text = email.subject
    }
}
