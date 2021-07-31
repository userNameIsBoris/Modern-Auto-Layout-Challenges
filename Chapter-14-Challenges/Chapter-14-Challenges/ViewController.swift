//
//  ViewController.swift
//  Chapter-14-Challenges
//
//  Created by Boris Ezhov on 31.07.2021.
//

import UIKit

class ViewController: UIViewController {
  @IBOutlet weak var scrollView: UIScrollView!

  override func viewDidLoad() {
    super.viewDidLoad()
    listenForNotifications()
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

