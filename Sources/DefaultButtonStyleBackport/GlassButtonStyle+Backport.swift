//
//  GlassButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension Backport where Content: PrimitiveButtonStyle {
    @MainActor
    var glass: some PrimitiveButtonStyle {
        #if os(visionOS)
        return .bordered
        #else
        if #available(iOS 26.0, macOS 26.0, tvOS 26.0, watchOS 26.0, *) {
            return .glass
        } else {
            return .bordered
        }
        #endif
    }

    @MainActor
    func glass(_ glass: Backported.Glass) -> some PrimitiveButtonStyle {
        #if os(visionOS)
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
