//
//  SecondChallengeViewController.swift
//  Chapter-12-Challenges
//
//  Created by Boris Ezhov on 25.07.2021.
//

import UIKit

class SecondChallengeViewController: UIViewController {
  private let headlineLabel: UILabel = {
    let label = UILabel()
    label.text = "Headline text style"
    label.numberOfLines = 0
    label.font = UIFont.preferredFont(forTextStyle: .headline)
    label.adjustsFontForContentSizeCategory = true
    return label
  }()
  private lazy var subheadlineLabel: UILabel = {
    let label = UILabel()
    label.text = "Subheadline text style"
    label.numberOfLines = 0
    configureSubheadlineItalicFont(for: label)
    return label
  }()
  private lazy var stackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [headlineLabel, subheadlineLabel])
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.distribution = .fillEqually
    stackView.spacing = UIStackView.spacingUseSystem
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    NotificationCenter.default.addObserver(self, selector: #selector(onContentSizeCategoryDidChange), name: UIContentSizeCategory.didChangeNotification, object: nil)
  }

  private func setupView() {
    view.addSubview(stackView)
    let constraints = [
      view.safeAreaLayoutGuide.leadingAnchor.constraint(equalTo: stackView.leadingAnchor),
      view.safeAreaLayoutGuide.trailingAnchor.constraint(equalTo: stackView.trailingAnchor),
      view.safeAreaLayoutGuide.topAnchor.constraint(equalTo: stackView.topAnchor),
      view.safeAreaLayoutGuide.bottomAnchor.constraint(equalTo: stackView.bottomAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
  }

  @objc private func onContentSizeCategoryDidChange() {
    configureSubheadlineItalicFont(for: subheadlineLabel)
  }

  private func configureSubheadlineItalicFont(for label: UILabel) {
    let descriptor = UIFontDescriptor.preferredFontDescriptor(withTextStyle: .subheadline)
    let boldDescriptor = descriptor.withSymbolicTraits(.traitItalic)!
    label.font = UIFont(descriptor: boldDescriptor, size: 0)
  }
}
