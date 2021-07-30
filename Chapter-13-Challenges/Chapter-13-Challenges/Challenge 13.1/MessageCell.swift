//
//  MessageCell.swift
//  Chapter-13-Challenges
//
//  Created by Boris Ezhov on 30.07.2021.
//

import UIKit

class MessageCell: UITableViewCell {
  let placeholderImageView: UIImageView = {
    let placeholderImage = UIImage(named: "Placeholder")
    let imageView = UIImageView(image: placeholderImage)
    imageView.contentMode = .top
    return imageView
  }()
  private let nameLabel: UILabel = {
    let label = UILabel()
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    label.adjustsFontForContentSizeCategory = true
    label.numberOfLines = 0
    label.setContentHuggingPriority(.defaultLow + 1, for: .vertical)
    label.setContentHuggingPriority(.defaultLow + 1, for: .horizontal)
    label.setContentCompressionResistancePriority(.defaultHigh + 1, for: .vertical)
    label.setContentCompressionResistancePriority(.defaultHigh + 1, for: .horizontal)
    return label
  }()
  private let textView: UITextView = {
    let textView = UITextView()
    textView.font = UIFont.preferredFont(forTextStyle: .body)
    textView.adjustsFontForContentSizeCategory = true
    textView.textContainer.lineFragmentPadding = 0
    textView.isEditable = false
    textView.isScrollEnabled = false
    return textView
  }()
  private lazy var textStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [nameLabel, textView])
    stackView.axis = .vertical
    stackView.alignment = .leading
    stackView.spacing = UIStackView.spacingUseSystem
    return stackView
  }()
  lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [placeholderImageView, textStackView])
    stackView.distribution = .fill
    stackView.translatesAutoresizingMaskIntoConstraints = false
    stackView.spacing = UIStackView.spacingUseSystem
    return stackView
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
  func configure(name: String, text: String) {
    nameLabel.text = name
    textView.text = text
  }

  private func setupView() {
    contentView.addSubview(stackView)
    let constraints = [
      stackView.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor),
      stackView.topAnchor.constraint(equalTo: contentView.layoutMarginsGuide.topAnchor),
      stackView.bottomAnchor.constraint(equalTo: contentView.layoutMarginsGuide.bottomAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
