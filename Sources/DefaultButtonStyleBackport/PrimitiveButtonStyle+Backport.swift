//
//  PrimitiveButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension PrimitiveButtonStyle where Self == DefaultButtonStyle {
    @MainActor @preconcurrency
    static var backport: Backport<Self> {
        Backport(DefaultButtonStyle())
    }
}
