//
//  SystemButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension Backport where Content: PrimitiveButtonStyle {
    /// A backport namespace entry for SwiftUI's bordered button style.
    ///
    /// Falls back to `.borderless` on iOS, Mac Catalyst, and macOS where
    /// `.bordered` is unavailable. tvOS and visionOS keep `.bordered` because
    /// that style is available on the minimum supported OS versions for those
    /// platforms. watchOS falls back to `.automatic`.
    @MainActor
    var bordered: some PrimitiveButtonStyle {
        #if targetEnvironment(macCatalyst)
        if #available(macCatalyst 15.0, *) {
            return .bordered
        } else {
            return .borderless
        }
        #elseif os(iOS)
        if #available(iOS 15.0, *) {
            return .bordered
        } else {
            return .borderless
        }
        #elseif os(macOS)
        if #available(macOS 12.0, *) {
            return .bordered
        } else {
            return .borderless
        }
        #elseif os(tvOS) || os(visionOS)
        return .bordered
        #elseif os(watchOS)
        return .automatic
        #else
        return .bordered
        #endif
    }

    /// A backport namespace entry for SwiftUI's bordered prominent button style.
    ///
    /// Falls back to `.borderless` on iOS, Mac Catalyst, and macOS where
    /// `.borderedProminent` is unavailable. tvOS keeps `.bordered` because
    /// `borderless` is unavailable on its minimum supported OS version.
    /// watchOS falls back to `.automatic`. visionOS keeps `.borderedProminent`
    /// because that style is available there.
    @MainActor
    var borderedProminent: some PrimitiveButtonStyle {
        #if targetEnvironment(macCatalyst)
        if #available(macCatalyst 15.0, *) {
            return .borderedProminent
        } else {
            return .borderless
        }
        #elseif os(iOS)
        if #available(iOS 15.0, *) {
            return .borderedProminent
        } else {
            return .borderless
        }
        #elseif os(macOS)
        if #available(macOS 12.0, *) {
            return .borderedProminent
        } else {
            return .borderless
        }
        #elseif os(tvOS)
        if #available(tvOS 15.0, *) {
            return .borderedProminent
        } else {
            return .bordered
        }
        #elseif os(watchOS)
        return .automatic
        #elseif os(visionOS)
        return .borderedProminent
        #else
        return .borderedProminent
        #endif
    }

}
