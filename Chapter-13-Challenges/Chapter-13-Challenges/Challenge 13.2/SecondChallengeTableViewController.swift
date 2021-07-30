//
//  SecondChallengeTableViewController.swift
//  Chapter-13-Challenges
//
//  Created by Boris Ezhov on 30.07.2021.
//

import UIKit

class SecondChallengeTableViewController: UITableViewController {
  private let cellReuseID = "TextViewCell"
  private let warAndPeaceStrings: [String] = [
    "BOOK ONE: 1805",
    "CHAPTER I",
    "“Well, Prince, so Genoa and Lucca are now just family estates of the Buonapartes.",
    "But I warn you, if you don’t tell me that this means war, if you still try to defend the infamies and horrors perpetrated by that Antichrist—I really believe he is Antichrist—I will have nothing more to do with you and you are no longer my friend, no longer my ‘faithful slave,’ as you call yourself!",
    "But how do you do?",
    "I see I have frightened you—sit down and tell me all the news.”"
  ]

  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.register(TextViewCell.self, forCellReuseIdentifier: cellReuseID)
    tableView.cellLayoutMarginsFollowReadableWidth = true
    tableView.tableFooterView = UIView()
  }

  // MARK: - Table view data source
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return warAndPeaceStrings.count
  }

  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseID, for: indexPath) as! TextViewCell
    let string = warAndPeaceStrings[indexPath.row]
    cell.configure(text: string)
    return cell
  }
}
