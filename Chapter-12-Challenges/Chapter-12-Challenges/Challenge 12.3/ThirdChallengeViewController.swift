//
//  ThirdChallengeViewController.swift
//  Chapter-12-Challenges
//
//  Created by Boris Ezhov on 29.07.2021.
//

import UIKit

class ThirdChallengeViewController: UIViewController {
  @IBOutlet weak var bookTitleLabel: UILabel!
  @IBOutlet weak var authorLabel: UILabel!
  @IBOutlet weak var chapterLabel: UILabel!
  @IBOutlet weak var textLabel: UITextView!

  private let fontName = "Ubuntu"
  private lazy var scaledFont: ScaledFont = {
    return ScaledFont(fontName: fontName)
  }()

  // MARK: - Life Cycle
  override func viewDidLoad() {
    super.viewDidLoad()
    configureFont()
    textLabel.textContainer.lineFragmentPadding = 0
  }

  // MARK: - Methods
  private func configureFont() {
    bookTitleLabel.font = scaledFont.font(forTextStyle: .title1)
    authorLabel.font = scaledFont.font(forTextStyle: .subheadline)
    chapterLabel.font = scaledFont.font(forTextStyle: .headline)
    textLabel.font = scaledFont.font(forTextStyle: .body)
  }
}
