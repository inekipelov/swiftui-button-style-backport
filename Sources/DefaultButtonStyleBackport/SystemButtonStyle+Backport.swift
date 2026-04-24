//
//  SystemButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension Backport where Content: PrimitiveButtonStyle {
    /// A backport namespace entry for SwiftUI's bordered button style.
    ///
    /// Falls back to `.borderless` where `.bordered` is unavailable, except on
    /// watchOS where the older fallback remains `.bordered`.
    @MainActor
    var bordered: some PrimitiveButtonStyle {
        #if os(watchOS)
        return .bordered
        #else
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, *) {
            return .bordered
        } else {
            return .borderless
        }
        #endif
    }

    /// A backport namespace entry for SwiftUI's bordered prominent button style.
    ///
    /// Falls back to `.borderless` where `.borderedProminent` is unavailable,
    /// except on watchOS where the older fallback remains `.bordered`.
    @MainActor
    var borderedProminent: some PrimitiveButtonStyle {
        #if os(watchOS)
        if #available(watchOS 8.0, *) {
            return .borderedProminent
        } else {
            return .bordered
        }
        #else
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, *) {
            return .borderedProminent
        } else {
            return .borderless
        }
        #endif
    }

}
