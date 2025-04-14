import SwiftUI

struct TitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size:24, weight: .semibold))
            
    }
}

struct SubtitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 18, weight: .medium))
            .foregroundColor(.gray)
    }
}

// MARK: - Extensões para facilitar o uso

extension View {
    func titleStyle() -> some View {
        self.modifier(TitleStyle())
    }

    func subtitleStyle() -> some View {
        self.modifier(SubtitleStyle())
    }
}
