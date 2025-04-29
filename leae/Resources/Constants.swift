import Foundation

// MARK: - Padding Values
struct Padding {
	static let mainScreen: CGFloat = 20
}

// MARK: - Spacing Values
struct Spacing {
	static let betweenSections: CGFloat = 16
	static let betweenItems: CGFloat = 10
	static let titleSepBody: CGFloat = 12
	static let bookcoverSepTitle: CGFloat = 5
}

// MARK: - Corner Radius
struct CornerRadius {
	static let small: CGFloat = 4
	static let medium: CGFloat = 8
	static let large: CGFloat = 12
}

// MARK: - Color Values
extension Color {
	static let accentHighlight = Color("Color/Accent/Highlight")
	static let backgroundBase = Color("Color/Background/Base")
	static let backgroundCard = Color("Color/Background/Card")
	static let backgroundMuted = Color("Color/Background/Muted")
	static let borderDefault = Color("Color/Border/Default")
	static let feedbackError = Color("Color/Feedback/Error")
	static let feedbackSuccess = Color("Color/Feedback/Success")
	static let feedbackWarning = Color("Color/Feedback/Warning")
	static let primaryDefault = Color("Color/Primary/Default")
	static let primaryHover = Color("Color/Primary/Hover")
	static let primaryMuted = Color("Color/Primary/Muted")
	static let secundaryBackground = Color("Color/Secundary/Background")
	static let secundaryDefault = Color("Color/Secundary/Default")
	static let textMuted = Color("Color/Text/Muted")
	static let textPrimary = Color("Color/Text/Primary")
	static let textSecundary = Color("Color/Text/Secundary")
}

// MARK: Card Size Values
struct CardSize {
	static let smallWidth: CGFloat = 85
	static let smallHeight: CGFloat = 130
}

// MARK: Title Box Size Values
struct TitleBoxSize {
	static let smallWidth: CGFloat = 85
	static let smallHeight: CGFloat = 32
}

// MARK: Line Limit Values
struct LineLimit {
	static let bookTitle: CGFloat = 85
}
