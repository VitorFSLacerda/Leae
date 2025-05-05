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
}

struct CommentOnFeed_Previews: PreviewProvider {
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

		CommentOnFeed(comment: comentario1)
	}
}
