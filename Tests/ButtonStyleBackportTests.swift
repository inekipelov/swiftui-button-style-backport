import SwiftUI
import XCTest
import ButtonStyleBackport

final class ButtonStyleBackportTests: XCTestCase {
    @MainActor
    func testButtonStyleBackportWrapperCompiles() {
        let wrapper = DefaultButtonStyle.backport

        XCTAssertTrue(type(of: wrapper.content) == DefaultButtonStyle.self)
    }

    @MainActor
    func testBackportModuleIsReexported() {
        let wrapper: Backport<DefaultButtonStyle> = DefaultButtonStyle.backport

        XCTAssertTrue(type(of: wrapper.content) == DefaultButtonStyle.self)
        _ = Backported.Glass.clear
    }

    @MainActor
    func testGlassButtonStyleBackportsCompile() {
        _ = DefaultButtonStyle.backport.glass
        _ = DefaultButtonStyle.backport.glass(.clear)
        _ = DefaultButtonStyle.backport.glass(.clear.tint(.blue).interactive(false))
        _ = DefaultButtonStyle.backport.glass(.regular)
        _ = DefaultButtonStyle.backport.glass(.regular.interactive().tint(.red))
        _ = DefaultButtonStyle.backport.glass(.identity)
    }

    @MainActor
    func testGlassProminentButtonStyleBackportCompiles() {
        _ = DefaultButtonStyle.backport.glassProminent
    }

    @MainActor
    func testSystemButtonStyleBackportsCompile() {
        _ = DefaultButtonStyle.backport.borderless
        _ = DefaultButtonStyle.backport.bordered
        _ = DefaultButtonStyle.backport.borderedProminent
        _ = DefaultButtonStyle.backport.link
        _ = DefaultButtonStyle.backport.card
        _ = DefaultButtonStyle.backport.accessoryBar
        _ = DefaultButtonStyle.backport.accessoryBarAction
    }

    @MainActor
    func testReadmeButtonStyleExamplesCompile() {
        _ = Button("Continue") {}
            .buttonStyle(.backport.glass)

        _ = Button("Confirm") {}
            .buttonStyle(.backport.glassProminent)

        _ = Button("Custom Glass") {}
            .buttonStyle(.backport.glass(.regular.interactive(true).tint(.blue)))
    }
}
