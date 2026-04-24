//
//  GlassProminentButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension Backport where Content: PrimitiveButtonStyle {
    @MainActor
    var glassProminent: some PrimitiveButtonStyle {
        #if os(visionOS)
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
