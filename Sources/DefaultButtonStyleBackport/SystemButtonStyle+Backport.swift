//
//  SystemButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension Backport where Content: PrimitiveButtonStyle {
    /// A backport namespace entry for SwiftUI's bordered button style.
    ///
    /// Falls back to `.borderless` where `.bordered` is unavailable.
    @MainActor
    var bordered: some PrimitiveButtonStyle {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            return .bordered
        } else {
            return .borderless
        }
    }

    /// A backport namespace entry for SwiftUI's bordered prominent button style.
    ///
    /// Falls back to `.borderless` where `.borderedProminent` is unavailable.
    @MainActor
    var borderedProminent: some PrimitiveButtonStyle {
        if #available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *) {
            return .borderedProminent
        } else {
            return .borderless
        }
    }

}
