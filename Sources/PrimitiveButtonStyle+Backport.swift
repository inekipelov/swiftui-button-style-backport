//
//  PrimitiveButtonStyle+Backport.swift
//

import SwiftUI
import Backport

public extension PrimitiveButtonStyle where Self == DefaultButtonStyle {
    /// A namespace for `DefaultButtonStyle` backports.
    ///
    /// Use this property to access backported button styles with call sites that
    /// mirror SwiftUI's native static member syntax:
    ///
    /// ```swift
    /// Button("Continue") {}
    ///     .buttonStyle(.backport.glass)
    /// ```
    @MainActor @preconcurrency
    static var backport: Backport<Self> {
        Backport(DefaultButtonStyle())
    }
}
