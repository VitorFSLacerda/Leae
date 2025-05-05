import SwiftUI

struct ReviewCard: View {
	let review: Resenha
	
	var body: some View {
		VStack(alignment: .leading, spacing: Spacing.small) {
			Text(review.usuario.apelido)
				.font(.subheadline.weight(.semibold))
				.foregroundColor(.textPrimary)
				.lineLimit(LineLimit.sectionHeader)
			
			HStack(alignment: .top, spacing: Spacing.small) {
				Image(review.livro.imagemCapa)
					.resizable()
					.scaledToFill()
					.frame(width: CardSize.smallWidth, height: CardSize.smallHeight, alignment: .center)
					.cornerRadius(CornerRadius.small)
					.clipped()
				
				VStack(alignment: .leading, spacing: Spacing.small) {
					Text(review.texto)
						.frame(width: TitleBoxSize.reviewCardWidth, height: TitleBoxSize.reviewCardHeight, alignment: .leading)
						.font(.footnote)
						.foregroundColor(.textPrimary)
						.lineLimit(LineLimit.commentCard)
					
					//Avaliacao por estrelas: adaptei por hora
					Text(String(format:"%.2f", review.avaliacao))
						.font(.body.weight(.bold))
						.foregroundColor(.textPrimary)
				}
				.padding(0.0)
			}
			.padding(0.0)
		}
		.padding(Padding.small)
	}
}

struct ReviewCarousel: View {
	let reviews: [Resenha]
	let header: String
	
	var body: some View {
		VStack(alignment: .leading, spacing: Spacing.titleSepBody) {
			Text(header)
				.font(.title2.weight(.bold))
				.foregroundColor(.textPrimary)
				.lineLimit(LineLimit.sectionHeader)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: Spacing.betweenItems) {
					ForEach(reviews) { review in
						ReviewCard(review: review)
					}
				}
				.padding(0.0)
			}
		}
	}
}

struct ReviewCarousel_Previews: PreviewProvider {
	static var previews: some View {
		let sampleHeader: String = "Sample Review Section"
		let sampleUsers = [
			Usuario(apelido: "@xpredoiv"),
			Usuario(apelido: "@maria_dorineves")
		]
		let sampleBooks = [
			Livro(titulo: "SwiftUI Essentials", autor: "Apple", genero: "Tecnologia", sinopse: "Aprenda SwiftUI.", imagemCapa: "livro1"),
			Livro(titulo: "Clean Code", autor: "Robert C. Martin", genero: "Programação", sinopse: "Práticas de código limpo.", imagemCapa: "livro2")
		]
		let sampleTexts: [String] = [
			"Esse final acabou comigo 🥲 Alguém mais aí precisando de terapia depois dessa leitura?",
			"Li por indicação daqui e amei! Que comunidade maravilhosa!"
		]
		let sampleReviews = [
			Resenha(livro: sampleBooks[0], usuario: sampleUsers[0], texto: sampleTexts[0], curtidas: 0, comentarios: [], avaliacao: 3.633),
			Resenha(livro: sampleBooks[1], usuario: sampleUsers[1], texto: sampleTexts[1], curtidas: 3, comentarios: [], avaliacao: 4.32)
		]
		ReviewCarousel(reviews: sampleReviews, header: sampleHeader)
	}
}
