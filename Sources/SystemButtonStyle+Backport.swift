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
    /// platforms. watchOS uses `.plain` on watchOS 6 and `.bordered` on watchOS
    /// 7 and later.
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
        if #available(watchOS 7.0, *) {
            return watchOSBordered()
        } else {
            return .plain
        }
        #else
        return .bordered
        #endif
    }

    /// A backport namespace entry for SwiftUI's bordered prominent button style.
    ///
    /// Falls back to `.borderless` on iOS, Mac Catalyst, and macOS where
    /// `.borderedProminent` is unavailable. tvOS keeps `.bordered` because
    /// `borderless` is unavailable on its minimum supported OS version.
    /// watchOS uses `.plain` on watchOS 6, `.bordered` on watchOS 7, and
    /// `.borderedProminent` on watchOS 8 and later. visionOS keeps
    /// `.borderedProminent` because that style is available there.
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
            return watchOSBorderedProminent()
        } else if #available(watchOS 7.0, *) {
            return watchOSBordered()
        } else {
            return .plain
        }
        #elseif os(visionOS)
        return .borderedProminent
        #else
        return .borderedProminent
        #endif
    }

#if os(watchOS)
    @available(watchOS 7.0, *)
    private func watchOSBordered() -> some PrimitiveButtonStyle {
        .bordered
    }

    @available(watchOS 8.0, *)
    private func watchOSBorderedProminent() -> some PrimitiveButtonStyle {
        .borderedProminent
    }
#endif

}
