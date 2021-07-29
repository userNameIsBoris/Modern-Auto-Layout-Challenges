//
//  ScaledFont.swift
//  Chapter-12-Challenges
//
//  Created by Boris Ezhov on 29.07.2021.
//

import UIKit

public struct ScaledFont {
  private typealias StyleDictionary = [UIFont.TextStyle.RawValue: FontDescription]
  private struct FontDescription: Decodable {
    let fontSize: CGFloat
    let fontName: String
  }

  private var styleDictionary: StyleDictionary?

  // MARK: - Initializers
  public init(fontName: String, in bundle: Bundle = Bundle.main) {
    guard let url = bundle.url(forResource: fontName, withExtension: "plist"), let data = try? Data(contentsOf: url) else { return }
    let decoder = PropertyListDecoder()
    styleDictionary = try? decoder.decode(StyleDictionary.self, from: data)
  }

  // MARK: - Methods
  public func font(forTextStyle textStyle: UIFont.TextStyle) -> UIFont {
    guard let fontDescription = styleDictionary?[textStyle.rawValue], let font = UIFont(name: fontDescription.fontName, size: fontDescription.fontSize) else { return UIFont.preferredFont(forTextStyle: textStyle) }
    let fontMetrics = UIFontMetrics(forTextStyle: textStyle)
    return fontMetrics.scaledFont(for: font)
  }
}
