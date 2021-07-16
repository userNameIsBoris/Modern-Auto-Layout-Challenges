//
//  SecondChallengeView.swift
//  Chapter-9-Challenges
//
//  Created by Boris Ezhov on 16.07.2021.
//

import UIKit

class SecondChallengeView: UIView {
  private let buttonEdgeInset: CGFloat = 10
  private let fontSize: CGFloat = 24
  private let systemSpacing: CGFloat = 8
  private let spacing: CGFloat = 16

  private lazy var greenButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("Don't Panic", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
    button.setTitleColor(UIColor.black, for: .normal)
    button.backgroundColor = UIColor.systemGreen
    button.contentEdgeInsets = UIEdgeInsets(top: buttonEdgeInset, left: buttonEdgeInset, bottom: buttonEdgeInset, right: buttonEdgeInset)
    return button
  }()
  private lazy var redButton: UIButton = {
    let button = UIButton(type: .custom)
    button.setTitle("Panic", for: .normal)
    button.titleLabel?.font = UIFont.systemFont(ofSize: fontSize)
    button.setTitleColor(UIColor.black, for: .normal)
    button.backgroundColor = UIColor.systemRed
    button.contentEdgeInsets = UIEdgeInsets(top: buttonEdgeInset, left: buttonEdgeInset, bottom: buttonEdgeInset, right: buttonEdgeInset)
    return button
  }()
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [greenButton, redButton])
    stackView.spacing = spacing
    stackView.distribution = .fillEqually
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: systemSpacing, leading: systemSpacing, bottom: systemSpacing, trailing: systemSpacing)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
  }

  // MARK: - Overridden Methods
  override func layoutSubviews() {
    super.layoutSubviews()
    let minButtonWidth = max(greenButton.intrinsicContentSize.width, redButton.intrinsicContentSize.width)
    let minWidth = minButtonWidth * 2 + spacing
    stackView.axis = minWidth > layoutMarginsGuide.layoutFrame.width ? .vertical : .horizontal
  }

  // MARK: - Helper Methods
  private func setupView() {
    let backgroundView = UIView()
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    backgroundView.backgroundColor = .systemBlue
    stackView.insertSubview(backgroundView, at: 0)

    addSubview(stackView)

    let constraints = [
      backgroundView.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
      backgroundView.topAnchor.constraint(equalTo: stackView.topAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
      stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
      stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
      stackView.topAnchor.constraint(equalTo: topAnchor),
      stackView.bottomAnchor.constraint(equalTo: bottomAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
