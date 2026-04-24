//
//  Glass+Backport.swift
//

import SwiftUI
import Backport

public extension Backported {
    /// A backported configuration model for SwiftUI Liquid Glass.
    ///
    /// Use this type with ``Backport/glass(_:)`` to keep call sites close to
    /// SwiftUI's native `PrimitiveButtonStyle.glass(_:)` syntax while still
    /// compiling on older operating systems and on visionOS.
    ///
    /// `Backported.Glass` is a lightweight value that stores only the selected
    /// variant, optional tint, and optional interactivity flag. On platforms
    /// where `SwiftUI.Glass` is available, the value is bridged to the native
    /// type. On older platforms and on visionOS, the button style falls back to
    /// `.bordered`.
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

        /// The regular Liquid Glass material variant.
        ///
        /// Mirrors `SwiftUI.Glass.regular`.
        public static var regular: Self {
            Self(variant: .regular)
        }

        /// The clear Liquid Glass material variant.
        ///
        /// Mirrors `SwiftUI.Glass.clear`.
        public static var clear: Self {
            Self(variant: .clear)
        }

        /// The identity glass variant.
        ///
        /// Mirrors `SwiftUI.Glass.identity`; when applied natively, content is
        /// unaffected as if no glass effect was applied.
        public static var identity: Self {
            Self(variant: .identity)
        }

        /// Returns a copy of this glass configuration with a tint color.
        ///
        /// - Parameter color: The tint color to apply, or `nil` to use the
        ///   system default.
        /// - Returns: A new glass configuration with the tint applied.
        public func tint(_ color: Color?) -> Self {
            Self(variant: variant, tintColor: color, isInteractive: isInteractive)
        }

        /// Returns a copy of this glass configuration with interactivity set.
        ///
        /// - Parameter isEnabled: Pass `true` to enable interactivity, or
        ///   `false` to disable it.
        /// - Returns: A new glass configuration with the interactivity flag
        ///   applied.
        public func interactive(_ isEnabled: Bool = true) -> Self {
            Self(variant: variant, tintColor: tintColor, isInteractive: isEnabled)
        }

        #if !os(visionOS)
        // SwiftUI.Glass is not declared on visionOS, so native bridging is excluded.
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
