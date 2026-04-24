//
//  GlassButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension Backport where Content: PrimitiveButtonStyle {
    /// A backport of SwiftUI's default glass button style.
    ///
    /// On iOS 26, macOS 26, tvOS 26, and watchOS 26, this returns SwiftUI's
    /// native `.glass` button style. On older supported OS versions and on
    /// visionOS, where SwiftUI does not declare Glass button styles, this
    /// falls back to `.bordered`.
    @MainActor
    var glass: some PrimitiveButtonStyle {
        #if os(visionOS)
        // SwiftUI does not declare Glass button styles on visionOS.
        return .bordered
        #else
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            return .glass
        } else {
            return .bordered
        }
        #endif
    }

    /// A backport of SwiftUI's configurable glass button style.
    ///
    /// Use this method with ``Backported/Glass`` values to mirror SwiftUI's
    /// native `.glass(_:)` syntax:
    ///
    /// ```swift
    /// Button("Continue") {}
    ///     .buttonStyle(.backport.glass(.clear.interactive().tint(.blue)))
    /// ```
    ///
    /// On iOS 26, macOS 26, tvOS 26, and watchOS 26, this bridges the
    /// backported configuration to `SwiftUI.Glass` and returns SwiftUI's native
    /// `.glass(_:)` button style. On older supported OS versions and on
    /// visionOS, where SwiftUI does not declare Glass button styles, this falls
    /// back to `.bordered`.
    ///
    /// - Parameter glass: The backported Liquid Glass configuration.
    /// - Returns: A native configurable glass style when available, otherwise
    ///   `.bordered`.
    @MainActor
    func glass(_ glass: Backported.Glass) -> some PrimitiveButtonStyle {
        #if os(visionOS)
        // SwiftUI does not declare Glass button styles on visionOS.
        return .bordered
        #else
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            return .glass(glass.swiftUIGlass)
        } else {
            return .bordered
        }
        #endif
    }
}
