import SwiftUI

struct LikesBox: View {
	let likes: Int
	let textSize: CFloat
	var body: some View {
		HStack(spacing: Spacing.iconBox) {
			Text("INSERIR SYSTEMNAME CORAÇÃO")
				.font(15)
			Text("\(likes)")
				.font(textSize)
		}
			.foregroundColor(.accentHighlight)
	}
}

struct SubCommentBox: View {
	let subcomments: Int
	let textSize: CFloat
	var body: some View {
		HStack(spacing: Spacing.iconBox) {
			Text("INSERIR SYSTEMNAME COMENTARIO")
				.font(15)
			Text("\(subcomments)")
				.font(textSize)
		}
			.foregroundColor(.accentHighlight)
	}
}

struct ProgressBox: View {
	let progress: Int
	let textSize: CFloat
	var body: some View {
		HStack(spacing: Spacing.iconBox) {
			// barra de progresso
			Text("\(progress)%")
				.font(textSize)
		}
			.foregroundColor(.accentHighlight)
	}
}
