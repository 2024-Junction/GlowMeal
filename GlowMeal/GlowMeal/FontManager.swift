//
//  FontManager.swift
//  GlowMeal
//
//  Created by 이준후 on 8/10/24.
//

import Foundation
import SwiftUI

extension Font {
    enum Pretendards {
        case black
        case bold
        case extrabold
        case extralight
        case light
        case medium
        case regular
        case semibold
        case thin
        case custom(String)
        
        var value: String {
            switch self {
            case .black:
                return "Pretendard-Black"
            case .bold:
                return "Pretendard-Bold"
            case .extrabold:
                return "Pretendard-ExtraBold"
            case .extralight:
                return "Pretendard-ExtraLight"
            case .light:
                return "Pretendard-Light"
            case .medium:
                return "Pretendard-Medium"
            case .regular:
                return "Pretendard-Regular"
            case .semibold:
                return "Pretendard-SemiBold"
            case .thin:
                return "Pretendard-Thin"
            case .custom(let name):
                return name
            }
        }
    }

    static func Pretendard(_ type: Pretendards, size: CGFloat = 17) -> Font {
        return .custom(type.value, size: size)
    }
}
