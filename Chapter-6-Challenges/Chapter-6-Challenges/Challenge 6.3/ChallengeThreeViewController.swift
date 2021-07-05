//
//  ChallengeThreeViewController.swift
//  Chapter-6-Challenges
//
//  Created by Boris Ezhov on 05.07.2021.
//

import UIKit

class ChallengeThreeViewController: UIViewController {
  private let greenViewInset: CGFloat = 50

  private let greenView: GreenView = {
    let view = GreenView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupView()
    setupConstraints()
  }

  // MARK: - Helper Methods
  private func setupView() {
    view.directionalLayoutMargins = NSDirectionalEdgeInsets(
      top: greenViewInset,
      leading: greenViewInset,
      bottom: greenViewInset,
      trailing: greenViewInset)
    view.backgroundColor = UIColor.systemYellow
    view.addSubview(greenView)
  }

  private func setupConstraints() {
    let constraints = [
      greenView.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor),
      greenView.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor),
      greenView.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor),
      greenView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.25),
    ]
    NSLayoutConstraint.activate(constraints)
  }
}

