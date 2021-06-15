//
//  RGBView.swift
//  Chapter-2-Challenges
//
//  Created by Boris Ezhov on 15.06.2021.
//

import UIKit

@IBDesignable
class RGBView: UIView {
  @IBInspectable private var spacing: CGFloat = 20
  private var barHeight: CGFloat {
    return (bounds.height - 2 * spacing) / 3
  }
  private var nextBarY: CGFloat {
    return barHeight + spacing
  }

  private var barViews = [UIView]()
  private let redBarView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.systemRed
    return view
  }()
  private let greenBarView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.systemGreen
    return view
  }()
  private let blueBarView: UIView = {
    let view = UIView()
    view.backgroundColor = UIColor.systemBlue
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

  // MARK: - Layout Subviews
  override func layoutSubviews() {
    super.layoutSubviews()
    adjustViews()
  }

  // MARK: - Methods
  private func setupViews() {
    barViews = [redBarView, greenBarView, blueBarView]
    barViews.forEach { addSubview($0) }
  }

  private func adjustViews() {
    for (index, barView) in barViews.enumerated() {
      barView.frame = CGRect(x: 0, y: CGFloat(index) * nextBarY, width: bounds.width, height: barHeight)
    }
  }
}
