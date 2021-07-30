//
//  TextViewCell.swift
//  Chapter-13-Challenges
//
//  Created by Boris Ezhov on 30.07.2021.
//

import UIKit

class TextViewCell: UITableViewCell {
  private let textView: UITextView = {
    let textView = UITextView()
    textView.font = UIFont.preferredFont(forTextStyle: .body)
    textView.adjustsFontForContentSizeCategory = true
    textView.textContainer.lineFragmentPadding = 0
    textView.isEditable = false
    textView.isScrollEnabled = false
    textView.translatesAutoresizingMaskIntoConstraints = false
    return textView
  }()

  // MARK: - Initializers
  override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    setupView()
  }

  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }

  // MARK: - Helper Methods
  func configure(text: String) {
    textView.text = text
  }

  private func setupView() {
    contentView.addSubview(textView)
    let constraints = [
      textView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
      textView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
      textView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
      textView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
