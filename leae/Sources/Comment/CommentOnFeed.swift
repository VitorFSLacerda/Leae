import SwiftUI

struct CommentOnFeed: View {
	let comment: Comentario
	
	var body: some View {
		VStack {
			NickAndProgress(comment: comment)
			
			HStack {
				Image(comment.livro.imagemCapa)
					.resizable()
					.scaledToFill()
					.frame(width:CardSize.smallWidth, height: CardSize.smallHeight, alignment: .center)
					.cornerRadius(CornerRadius.small)
					.clipped()
				
				Text(comment.texto)
					.font(.subheadline)
					.foregroundColor(.textPrimary)
					.lineLimit(LineLimit.commentCard)
			}
		}
	}
}

struct CommentOnFeed_Previews: PreviewProvider {
	static var previews: some View {
		let comment = MockCommentGenerator.mockComment()
		CommentOnFeed(comment: comment)
	}
}
