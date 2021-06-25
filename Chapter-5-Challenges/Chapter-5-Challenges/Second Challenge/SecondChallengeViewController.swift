//
//  SecondChallengeViewController.swift
//  Chapter-5-Challenges
//
//  Created by Boris Ezhov on 25.06.2021.
//

import UIKit

class SecondChallengeViewController: UIViewController {
  private let externalSpacing: CGFloat = 50

  private let greenView: SecondChallengeView = {
    let view = SecondChallengeView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupViews()
  }

  // MARK: - Methods
  private func setupViews() {
    view.backgroundColor = UIColor.systemYellow
    view.addSubview(greenView)

    let constraints = [
      // Green view constraints
      greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: externalSpacing),
      greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -externalSpacing),
      greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: externalSpacing),
      greenView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
