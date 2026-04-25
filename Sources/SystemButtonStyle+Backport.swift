//
//  SystemButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension Backport where Content: PrimitiveButtonStyle {
    /// A backport namespace entry for SwiftUI's automatic button style.
    @MainActor
    var automatic: some PrimitiveButtonStyle {
        .automatic
    }

    /// A backport namespace entry for SwiftUI's plain button style.
    @MainActor
    var plain: some PrimitiveButtonStyle {
        .plain
    }

    /// A backport namespace entry for SwiftUI's borderless button style.
    @MainActor
    var borderless: some PrimitiveButtonStyle {
        #if os(tvOS)
        if #available(tvOS 17.0, *) {
            return .borderless
        } else {
            return .plain
        }
        #elseif os(watchOS)
        if #available(watchOS 8.0, *) {
            return .borderless
        } else {
            return .automatic
        }
        #else
        return .borderless
        #endif
    }

    /// A backport namespace entry for SwiftUI's bordered button style.
    ///
    /// Falls back to `.borderless` on iOS, Mac Catalyst, and macOS where
    /// `.bordered` is unavailable. tvOS and visionOS keep `.bordered` because
    /// that style is available on the minimum supported OS versions for those
    /// platforms. watchOS uses `.automatic` as the fallback where `.bordered`
    /// is unavailable.
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
            return .bordered
        } else {
            return .automatic
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
    /// watchOS uses `.automatic` as the fallback where `.borderedProminent` is
    /// unavailable. visionOS keeps `.borderedProminent` because that style is
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
            return .automatic
        }
        #elseif os(visionOS)
        return .borderedProminent
        #else
        return .borderedProminent
        #endif
    }

    /// A backport namespace entry for SwiftUI's link button style.
    @MainActor
    var link: some PrimitiveButtonStyle {
        #if os(macOS)
        return .link
        #elseif os(watchOS)
        return .automatic
        #else
        return .plain
        #endif
    }

    /// A backport namespace entry for SwiftUI's card button style.
    @MainActor
    var card: some PrimitiveButtonStyle {
        #if os(tvOS)
        if #available(tvOS 14.0, *) {
            return .card
        } else {
            return .plain
        }
        #elseif os(watchOS)
        return .automatic
        #else
        return .plain
        #endif
    }

    /// A backport namespace entry for SwiftUI's accessory bar button style.
    @MainActor
    var accessoryBar: some PrimitiveButtonStyle {
        #if os(macOS)
        if #available(macOS 14.0, *) {
            return .accessoryBar
        } else {
            return .borderless
        }
        #elseif os(watchOS)
        return .automatic
        #else
        return .plain
        #endif
    }

    /// A backport namespace entry for SwiftUI's accessory bar action button style.
    @MainActor
    var accessoryBarAction: some PrimitiveButtonStyle {
        #if os(macOS)
        if #available(macOS 14.0, *) {
            return .accessoryBarAction
        } else {
            return .borderless
        }
        #elseif os(watchOS)
        return .automatic
        #else
        return .plain
        #endif
    }

}
