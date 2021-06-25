//
//  FirstChallengeViewController.swift
//  Chapter-5-Challenges
//
//  Created by Boris Ezhov on 25.06.2021.
//

import UIKit

class FirstChallengeViewController: UIViewController {
  private let externalSpacing: CGFloat = 50
  private let internalSpacing: CGFloat = 25

  private let greenView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.systemGreen
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private let redView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.systemRed
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
    view.addSubview(redView)

    let constraints = [
      // Green view constraints
      greenView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: externalSpacing),
      greenView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -externalSpacing),
      greenView.topAnchor.constraint(equalTo: view.topAnchor, constant: externalSpacing),
      greenView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -externalSpacing),
      // Red view constraints
      redView.leadingAnchor.constraint(equalTo: greenView.leadingAnchor, constant: internalSpacing),
      redView.trailingAnchor.constraint(equalTo: greenView.trailingAnchor, constant: -internalSpacing),
      redView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.2),
      redView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
