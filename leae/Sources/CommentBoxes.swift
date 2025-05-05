import SwiftUI

struct LikesBox: View {
	let likes: Int
	let liked: Bool
	let font: Font?
	var body: some View {
		HStack(spacing: Spacing.iconBox) {
			Image(systemName: liked ? "heart.fill" : "heart")
				
			Text("\(likes)")
				.font(font)
		}
			.foregroundColor(.accentHighlight)
	}
}

struct SubCommentBox: View {
	let subcomments: Int
	let font: Font?
	var body: some View {
		HStack(spacing: Spacing.iconBox) {
			Image(systemName: "ellipsis.message")
			Text("\(subcomments)")
				.font(font)
		}
			.foregroundColor(.accentHighlight)
	}
}

struct ProgressBox: View {
	let progress: Int
	let font: Font?
	var body: some View {
		HStack(spacing: Spacing.iconBox) {
			// barra de progresso
			Text("\(progress)%")
				.font(font)
		}
			.foregroundColor(.accentHighlight)
	}
}
