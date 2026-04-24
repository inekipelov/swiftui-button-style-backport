//
//  SystemButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension Backport where Content: PrimitiveButtonStyle {
    /// A backport namespace entry for SwiftUI's bordered button style.
    ///
    /// Falls back to `.borderless` where `.bordered` is unavailable on iOS and
    /// macOS, but keeps `.bordered` on tvOS and watchOS because `borderless`
    /// is unavailable on those platforms at the deployment targets this package
    /// supports.
    @MainActor
    var bordered: some PrimitiveButtonStyle {
        #if os(tvOS) || os(watchOS)
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
    /// Falls back to `.borderless` where `.borderedProminent` is unavailable
    /// on iOS and macOS, but keeps `.bordered` on tvOS and watchOS because
    /// `borderless` is unavailable on those platforms at the deployment targets
    /// this package supports.
    @MainActor
    var borderedProminent: some PrimitiveButtonStyle {
        #if os(tvOS)
        if #available(tvOS 15.0, *) {
            return .borderedProminent
        } else {
            return .bordered
        }
        #elseif os(watchOS)
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
