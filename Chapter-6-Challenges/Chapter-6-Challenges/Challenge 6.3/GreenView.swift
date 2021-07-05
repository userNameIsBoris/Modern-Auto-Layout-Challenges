//
//  GreenView.swift
//  Chapter-6-Challenges
//
//  Created by Boris Ezhov on 05.07.2021.
//

import UIKit

class GreenView: UIView {
  private let blueRedViewInset: CGFloat = 25

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
    setupView()
    setupConstraints()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setupView()
    setupConstraints()
  }
  
  // MARK: - Helper Methods
  private func setupView() {
    backgroundColor = UIColor.systemGreen
    directionalLayoutMargins = NSDirectionalEdgeInsets(
      top: blueRedViewInset,
      leading: blueRedViewInset,
      bottom: blueRedViewInset,
      trailing: blueRedViewInset)
    addSubview(blueView)
    addSubview(redView)
  }

  private func setupConstraints() {
    let constraints = [
      blueView.leadingAnchor.constraint(equalTo: layoutMarginsGuide.leadingAnchor),
      blueView.trailingAnchor.constraint(equalTo: redView.leadingAnchor, constant: -blueRedViewInset),
      blueView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      blueView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),

      blueView.widthAnchor.constraint(equalTo: redView.widthAnchor),

      redView.trailingAnchor.constraint(equalTo: layoutMarginsGuide.trailingAnchor),
      redView.topAnchor.constraint(equalTo: layoutMarginsGuide.topAnchor),
      redView.bottomAnchor.constraint(equalTo: layoutMarginsGuide.bottomAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
  }
}
