//
//  SecondChallengeViewController.swift
//  Chapter-9-Challenges
//
//  Created by Boris Ezhov on 16.07.2021.
//

import UIKit

class SecondChallengeViewController: UIViewController {
  private let customView: SecondChallengeView = {
    let view = SecondChallengeView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
  }

  // MARK: - Helper Methods
  private func setupView() {
    view.backgroundColor = UIColor.systemYellow
    view.addSubview(customView)
    let constraints = [
      customView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
      customView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
      customView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
