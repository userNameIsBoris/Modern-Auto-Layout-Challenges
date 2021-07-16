//
//  ViewController.swift
//  Chapter-9-Challenges
//
//  Created by Boris Ezhov on 16.07.2021.
//

import UIKit

class FirstChallengeViewController: UIViewController {
  @IBOutlet weak var redButtonX4HeightConstraint: NSLayoutConstraint!
  @IBOutlet weak var greenButtonX4HeightConstraint: NSLayoutConstraint!

  private let animationDuration = 1.5
  private let animationDampingRatio: CGFloat = 0.5

  // MARK: - Actions
  @IBAction func redButtonPressed() {
    redButtonX4HeightConstraint.isActive = true
    greenButtonX4HeightConstraint.isActive = false
    animateLayoutChanges()
  }
  
  @IBAction func greenButtonPressed() {
    redButtonX4HeightConstraint.isActive = false
    greenButtonX4HeightConstraint.isActive = true
    animateLayoutChanges()
  }

  // MARK: - Helper Methods
  private func animateLayoutChanges() {
    let animator = UIViewPropertyAnimator(duration: animationDuration, dampingRatio: animationDampingRatio) {
      self.view.layoutIfNeeded()
    }
    animator.startAnimation()
  }
}
