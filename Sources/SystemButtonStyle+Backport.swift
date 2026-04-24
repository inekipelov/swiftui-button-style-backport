//
//  SystemButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension Backport where Content: PrimitiveButtonStyle {
    /// A backport namespace entry for SwiftUI's bordered button style.
    ///
    /// Falls back to `.borderless` on iOS, Mac Catalyst, and macOS where
    /// `.bordered` is unavailable. tvOS, watchOS, and visionOS keep `.bordered`
    /// because that style is available on the minimum supported OS versions
    /// for those platforms.
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
        #elseif os(tvOS) || os(watchOS) || os(visionOS)
        return .bordered
        #else
        return .bordered
        #endif
    }

    /// A backport namespace entry for SwiftUI's bordered prominent button style.
    ///
    /// Falls back to `.borderless` on iOS, Mac Catalyst, and macOS where
    /// `.borderedProminent` is unavailable. tvOS and watchOS keep `.bordered`
    /// because `borderless` is unavailable on their minimum supported OS
    /// versions. visionOS keeps `.borderedProminent` because that style is
    /// available there.
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
        if #available(watchOS 8.0, *) {
            return .borderedProminent
        } else {
            return .bordered
        }
        #elseif os(visionOS)
        return .borderedProminent
        #else
        return .borderedProminent
        #endif
    }

}
