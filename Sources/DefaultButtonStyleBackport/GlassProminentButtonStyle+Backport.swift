//
//  GlassProminentButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension Backport where Content: PrimitiveButtonStyle {
    /// A backport of SwiftUI's prominent glass button style.
    ///
    /// On iOS 26, macOS 26, tvOS 26, and watchOS 26, this returns SwiftUI's
    /// native `.glassProminent` button style. On older supported OS versions
    /// and on visionOS, where SwiftUI does not declare Glass button styles,
    /// this falls back to `.borderedProminent`.
    @MainActor
    var glassProminent: some PrimitiveButtonStyle {
        #if os(visionOS)
        // SwiftUI does not declare Glass button styles on visionOS.
        return .borderedProminent
        #else
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            return .glassProminent
        } else {
            return .borderedProminent
        }
        #endif
    }
}
