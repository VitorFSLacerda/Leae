import SwiftUI

struct CommentCard: View {
	let comment: Comentario

	var body: some View {
		VStack {
			Text(comment.usuario.nome)
				.font(15.fontWeight(.bold))
				.foregroundColor(.textPrimary)
			HStack {
				Image(comment.livro.imagem)
					.resizable()
					.scaledToFill()
					.frame(width:CardSize.smallWidth, height: CardSize.smallHeight, alignment: .center)
					.cornerRadius(CornerRadius.small)
					.clipped()
				
				VStack {
					Text(comment.texto)
						.font(15)
						.foregroundColor(.textPrimary)
						.lineLimit(LineLimit.commentCard)
					
					HStack {
						// retirar 12 hardcoded
						LikesBox(likes: comment.curtidas, textSize: 12)
						SubCommentBox(subcomments: comment.comentarios.count, textSize: 12)
						ProgressBox(progress: comment.progresso, textSize: 12)
					}
				}
			}
		}
	}
}

struct CommentCard_Previews: PreviewProvider {
	static var previews: some View {
		let livro1 = Livro(
			titulo: "SwiftUI Essentials",
			autor: "Apple",
			genero: "Tecnologia",
			sinopse: "Aprenda SwiftUI.",
			imagemCapa: "livro1"
		)

		let usuario1 = Usuario(
			apelido: "@xpredoiv",
			nome: "João Silva",
			email: "joao@example.com",
			senha: "senha123"
		)

		let comentario1 = Comentario(
			livro: livro1,
			usuario: usuario1,
			texto: "Este livro é incrível! Recomendo a todos que querem aprender SwiftUI."
		)

		CommentCard(comment: comentario1)
	}
}
