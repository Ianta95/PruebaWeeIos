//
//  Enums.swift
//  PruebaWee
//
//  Created by Ian De Jesus on 15/02/21.
//

import Foundation
import UIKit

private let familyName = "Gotham"

enum AppFont: String {
    case regular = "Gotham-Book "
    case bold = "GothamPro-Bold"

    func size(_ size: CGFloat) -> UIFont {
        if let font = UIFont(name: fullFontName, size: size + 1.0) {
            return font
        }
        fatalError("Font '\(fullFontName)' does not exist.")
    }
    fileprivate var fullFontName: String {
        return rawValue.isEmpty ? familyName : rawValue
    }
}
