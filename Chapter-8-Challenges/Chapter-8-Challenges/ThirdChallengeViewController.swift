//
//  ViewController.swift
//  Chapter-8-Challenges
//
//  Created by Boris Ezhov on 10.07.2021.
//

import UIKit

class ThirdChallengeViewController: UIViewController {
  private let fontSize: CGFloat = 40
  private let spacing: CGFloat = 16

  private let codeSwitch: UISwitch = {
    let codeSwitch = UISwitch()
    codeSwitch.addTarget(self, action: #selector(codeSwitchValueChanged), for: .valueChanged)
    return codeSwitch
  }()
  private lazy var labels = [
    UILabel.custom(text: "1A", fontSize: fontSize, textAlignment: .center, backgroundColor: .systemYellow, cornerRadius: 5),
    UILabel.custom(text: "2BX", fontSize: fontSize, textAlignment: .center, backgroundColor: .systemYellow, cornerRadius: 5),
    UILabel.custom(text: "3Z", fontSize: fontSize, textAlignment: .center, backgroundColor: .systemYellow, cornerRadius: 5),
  ]
  private lazy var textStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: labels)
    stackView.spacing = spacing
    stackView.distribution = .fillEqually
    return stackView
  }()
  private lazy var rootStackView: UIStackView = {
    let stackView = UIStackView(arrangedSubviews: [codeSwitch, textStackView])
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = spacing
    stackView.isLayoutMarginsRelativeArrangement = true
    stackView.directionalLayoutMargins = NSDirectionalEdgeInsets(top: spacing, leading: spacing, bottom: spacing, trailing: spacing)
    stackView.translatesAutoresizingMaskIntoConstraints = false
    return stackView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  private func setupView() {
    labels.forEach { $0.layer.opacity = 0 }
    view.addSubview(rootStackView)
    let constraints = [
      rootStackView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
      rootStackView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
      rootStackView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
    setupRootStackViewBackground()
  }

  private func setupRootStackViewBackground() {
    let backgroundView = UIView()
    backgroundView.backgroundColor = UIColor.systemPurple
    backgroundView.layer.cornerRadius = 10
    backgroundView.translatesAutoresizingMaskIntoConstraints = false
    rootStackView.insertSubview(backgroundView, at: 0)
    let constraints = [
      backgroundView.leadingAnchor.constraint(equalTo: rootStackView.leadingAnchor),
      backgroundView.trailingAnchor.constraint(equalTo: rootStackView.trailingAnchor),
      backgroundView.topAnchor.constraint(equalTo: rootStackView.topAnchor),
      backgroundView.bottomAnchor.constraint(equalTo: rootStackView.bottomAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
  }

  @objc private func codeSwitchValueChanged() {
    UIView.animate(withDuration: 0.5) {
      self.labels.forEach { $0.layer.opacity = self.codeSwitch.isOn ? 1 : 0 }
    }
  }
}
