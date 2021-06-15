//
//  SecondChallengeViewController.swift
//  Chapter-2-Challenges
//
//  Created by Boris Ezhov on 15.06.2021.
//

import UIKit

class SecondChallengeViewController: UIViewController {
  private let outerMargin: CGFloat = 50
  private let internalMargin: CGFloat = 25
  private let fixedHeight: CGFloat = 100

  private let greenView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.systemGreen
    view.autoresizingMask = [.flexibleHeight, .flexibleWidth]
    return view
  }()
  private let redView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.systemRed
    view.autoresizingMask = [.flexibleWidth, .flexibleTopMargin, .flexibleBottomMargin]
    return view
  }()

  // MARK: - Life Cycles
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = UIColor.systemYellow
    greenView.addSubview(redView)
  }

  override func viewWillLayoutSubviews() {
    guard greenView.superview == nil else { return }
    view.addSubview(greenView)
    adjustViews()
  }

  // MARK: - Methods
  private func adjustViews() {
    // Adjust green view
    var width = view.bounds.width - 2 * outerMargin
    let height = view.bounds.height - 2 * outerMargin
    greenView.frame = CGRect(x: outerMargin, y: outerMargin, width: width, height: height)
    // Adjust red view
    let midY = greenView.bounds.midY - fixedHeight / 2
    width = greenView.bounds.width - 2 * internalMargin
    redView.frame = CGRect(x: internalMargin, y: midY, width: width, height: fixedHeight)
  }
}
