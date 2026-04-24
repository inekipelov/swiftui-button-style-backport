# DefaultButtonStyleBackport

`DefaultButtonStyleBackport` is a tiny Swift Package that backports modern
SwiftUI button styles through the reusable `Backport` wrapper.

It builds on [`swift-backport-pattern`](https://github.com/inekipelov/swift-backport-pattern)
and provides compatibility fallbacks for Liquid Glass button styles.

<p align="center">
  <a href="https://swift.org"><img src="https://img.shields.io/badge/Swift-5.9+-F05138?logo=swift&logoColor=white" alt="Swift 5.9+"></a>
  <a href="https://developer.apple.com/ios/"><img src="https://img.shields.io/badge/iOS-13.0+-000000?logo=apple" alt="iOS 13.0+"></a>
  <a href="https://developer.apple.com/macos/"><img src="https://img.shields.io/badge/macOS-10.15+-000000?logo=apple" alt="macOS 10.15+"></a>
  <a href="https://developer.apple.com/tvos/"><img src="https://img.shields.io/badge/tvOS-13.0+-000000?logo=apple" alt="tvOS 13.0+"></a>
  <a href="https://developer.apple.com/watchos/"><img src="https://img.shields.io/badge/watchOS-6.0+-000000?logo=apple" alt="watchOS 6.0+"></a>
  <a href="https://developer.apple.com/visionos/"><img src="https://img.shields.io/badge/visionOS-1.0+-000000?logo=apple" alt="visionOS 1.0+"></a>
</p>

## Preview

<p align="center">
  <img src="docs/button-style-preview.gif" alt="DefaultButtonStyleBackport preview animation showing glass button styles" style="max-width: 480px; width: 100%; height: auto;">
</p>

## Usage

```swift
import SwiftUI
import DefaultButtonStyleBackport

Button("Continue") {
    // Action
}
.buttonStyle(.backport.glass)

Button("Confirm") {
    // Action
}
.buttonStyle(.backport.glassProminent)

Button("Custom Glass") {
    // Action
}
.buttonStyle(.backport.glass(.regular.interactive(true).tint(.blue)))

Button("Secondary") {
    // Action
}
.buttonStyle(.backport.borderedProminent)
```

On iOS 26, macOS 26, tvOS 26, and watchOS 26, the package uses native SwiftUI
Liquid Glass button styles. On older supported OS versions and on visionOS, it
falls back to `.bordered` and `.borderedProminent`.

The system-style helpers are also backported:

```swift
.buttonStyle(.backport.bordered)
.buttonStyle(.backport.borderedProminent)
```

On iOS 13/14 and macOS 10.15/11, where SwiftUI's native `.bordered` and
`.borderedProminent` styles are unavailable, those helpers fall back to
`.borderless`. On tvOS 13/14 and watchOS 6/7, they fall back to `.bordered`
because `borderless` is unavailable there.

The configurable glass API mirrors SwiftUI's native syntax through
`Backported.Glass`:

```swift
.buttonStyle(.backport.glass(.clear))
.buttonStyle(.backport.glass(.clear.interactive(false).tint(.blue)))
.buttonStyle(.backport.glass(.regular.interactive().tint(.red)))
.buttonStyle(.backport.glass(.identity))
```

## Installation

Add the package to your `Package.swift` dependencies:

```swift
.package(url: "https://github.com/inekipelov/swiftui-button-style-backport.git", from: "0.1.0")
```

Then add `DefaultButtonStyleBackport` to your target dependencies:

```swift
.product(name: "DefaultButtonStyleBackport", package: "swiftui-button-style-backport")
```

`DefaultButtonStyleBackport` depends on
[`swift-backport-pattern`](https://github.com/inekipelov/swift-backport-pattern)
for the `Backport` wrapper. The package re-exports `Backport`, so importing
`DefaultButtonStyleBackport` is enough.
