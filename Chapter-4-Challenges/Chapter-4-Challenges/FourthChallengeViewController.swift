//
//  FourthChallengeViewController.swift
//  Chapter-4-Challenges
//
//  Created by Boris Ezhov on 20.06.2021.
//

import UIKit

class FourthChallengeViewController: UIViewController {
  @IBOutlet weak var startButton: UIButton!
  @IBOutlet weak var startButtonCenterYConstraint: NSLayoutConstraint!
  

  override func viewDidLoad() {
    super.viewDidLoad()
    startButtonCenterYConstraint.constant = -100
  }

  @IBAction func buttonTapped() {
    startButtonCenterYConstraint.constant = 0
    UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut) { [weak self] in
      self?.view.layoutIfNeeded()
    }
  }
}
