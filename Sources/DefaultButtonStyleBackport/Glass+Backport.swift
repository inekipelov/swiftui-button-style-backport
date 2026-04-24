//
//  Glass+Backport.swift
//

import SwiftUI
import Backport

public extension Backported {
    struct Glass: Sendable {
        private enum Variant: Sendable {
            case regular
            case clear
            case identity
        }

        private let variant: Variant
        private let tintColor: Color?
        private let isInteractive: Bool?

        private init(variant: Variant, tintColor: Color? = nil, isInteractive: Bool? = nil) {
            self.variant = variant
            self.tintColor = tintColor
            self.isInteractive = isInteractive
        }

        public static var regular: Self {
            Self(variant: .regular)
        }

        public static var clear: Self {
            Self(variant: .clear)
        }

        public static var identity: Self {
            Self(variant: .identity)
        }

        public func tint(_ color: Color?) -> Self {
            Self(variant: variant, tintColor: color, isInteractive: isInteractive)
        }

        public func interactive(_ isEnabled: Bool = true) -> Self {
            Self(variant: variant, tintColor: tintColor, isInteractive: isEnabled)
        }

        #if !os(visionOS)
        @available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *)
        var swiftUIGlass: SwiftUI.Glass {
            let glass: SwiftUI.Glass = switch variant {
            case .regular:
                .regular
            case .clear:
                .clear
            case .identity:
                .identity
            }

            let interactiveGlass = if let isInteractive {
                glass.interactive(isInteractive)
            } else {
                glass
            }

            return interactiveGlass.tint(tintColor)
        }
        #endif
    }
}
