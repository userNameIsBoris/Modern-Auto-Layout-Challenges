//
//  ViewController.swift
//  Chapter-11-Challenges
//
//  Created by Boris Ezhov on 23.07.2021.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!

  private let infoButton: UIButton = {
    let button = UIButton(type: .infoDark)
    button.tintColor = UIColor.black
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    setupInfoButton()
    listenForNotifications()
  }

  private func setupInfoButton() {
    scrollView.addSubview(infoButton)
    let constraints = [
      scrollView.layoutMarginsGuide.leadingAnchor.constraint(equalTo: infoButton.leadingAnchor),
      scrollView.layoutMarginsGuide.topAnchor.constraint(equalTo: infoButton.topAnchor),
    ]
    NSLayoutConstraint.activate(constraints)
  }

  private func listenForNotifications() {
    NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardDidShow(_:)), name: UIResponder.keyboardDidShowNotification, object: nil)
    NotificationCenter.default.addObserver(self, selector: #selector(onKeyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
  }

  @objc private func onKeyboardDidShow(_ notification: Notification) {
    guard let userInfo = notification.userInfo, let frame = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
    let keyboardSize = frame.cgRectValue.size
    let edgeInsets = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
    adjustScrollViewInsets(edgeInsets)
  }

  @objc private func onKeyboardWillHide() {
    adjustScrollViewInsets(.zero)
  }

  private func adjustScrollViewInsets(_ edgeInsets: UIEdgeInsets) {
    scrollView.contentInset = edgeInsets
    scrollView.scrollIndicatorInsets = edgeInsets
  }
}

