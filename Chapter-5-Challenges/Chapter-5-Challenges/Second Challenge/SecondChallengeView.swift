//
//  SecondChallengeView.swift
//  Chapter-5-Challenges
//
//  Created by Boris Ezhov on 25.06.2021.
//

import UIKit

class SecondChallengeView: UIView {
  private let internalSpacing: CGFloat = 25

  private let blueView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.systemBlue
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()
  private let redView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.systemRed
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
  }()

  // MARK: - Initializers
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupViews()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupViews()
  }

  // MARK: - Methods
  private func setupViews() {
    backgroundColor = UIColor.systemGreen
    addSubview(redView)
    addSubview(blueView)

    let constraints = [
      // Blue view constraints
      blueView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: internalSpacing),
      blueView.topAnchor.constraint(equalTo: topAnchor, constant: internalSpacing),
      blueView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -internalSpacing),
      blueView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5, constant: -1.5 * internalSpacing),
      // Red view constraints
      redView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -internalSpacing),
      redView.topAnchor.constraint(equalTo: blueView.topAnchor),
      redView.bottomAnchor.constraint(equalTo: blueView.bottomAnchor),
      redView.widthAnchor.constraint(equalTo: blueView.widthAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
