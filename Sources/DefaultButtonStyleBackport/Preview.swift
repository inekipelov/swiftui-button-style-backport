















import SwiftUI

@available(iOS 17.0, macOS 14.0, tvOS 17.0, watchOS 10.0, visionOS 1.0, *)
#Preview {
    HStack {
        VStack(spacing: 16) {
            Button("Orange") {}
                .tint(.orange)
            Button("Mint") {}
                .tint(.mint)
            Button("Green") {}
                .tint(.green)
            Button("Indigo") {}
                .tint(.indigo)
            Button("Pink") {}
                .tint(.pink)
        }
        .buttonStyle(.backport.glass)
        VStack(spacing: 16) {
            Button("Orange") {}
                .tint(.orange)
            Button("Mint") {}
                .tint(.mint)
            Button("Green") {}
                .tint(.green)
            Button("Indigo") {}
                .tint(.indigo)
            Button("Pink") {}
                .tint(.pink)
        }
        .buttonStyle(.backport.glassProminent)
        VStack(spacing: 16) {
            Button("Orange") {}
                .tint(.orange)
            Button("Mint") {}
                .tint(.mint)
            Button("Green") {}
                .tint(.green)
            Button("Indigo") {}
                .tint(.indigo)
            Button("Pink") {}
                .tint(.pink)
        }
        .buttonStyle(.backport.glass(.regular.tint(.orange.opacity(0.1))))
    }
    .controlSize(.extraLarge)
}
