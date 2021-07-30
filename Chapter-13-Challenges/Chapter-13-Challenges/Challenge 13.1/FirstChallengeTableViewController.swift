//
//  FirstChallengeTableViewController.swift
//  Chapter-13-Challenges
//
//  Created by Boris Ezhov on 30.07.2021.
//

import UIKit

class FirstChallengeTableViewController: UITableViewController {
  private let messageCellReuseID = "MessageCell"
  private let messages: [Message] = [
    Message(name: "Joe", text: "Hello World!"),
    Message(name: "Peter Piper", text: "Mr. Watson I presume"),
    Message(name: "Harry Housefield", text: "Once upon a time, in a land far far away"),
    Message(name: "Sir Roger Martin-Grayson III", text: "I cannot wait to see what happens next. I do hope they all lived happily ever after."),
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(MessageCell.self, forCellReuseIdentifier: messageCellReuseID)
    tableView.tableFooterView = UIView()
  }

  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return messages.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: messageCellReuseID, for: indexPath) as! MessageCell
    let message = messages[indexPath.row]
    cell.configure(name: message.name, text: message.text)
    return cell
  }
}
