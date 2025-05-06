import SwiftUI

struct GroupCard: View {
	let group: Grupo

	var body: some View {
		HStack {
			Image(group.imagem)
				.resizable()
				.scaledToFill()
				.frame(width: CardSize.smallSquare, height: CardSize.smallSquare, alignment: .center)
				.cornerRadius(CornerRadius.medium)
				.clipped()

			VStack() {
				Text(group.nome)
					.font(.callout)
					.foregroundColor(.textPrimary)
				Text(group.livro.titulo)
					.font(.subheadline)
					.foregroundColor(.textSecundary)
					.lineLimit(1)
				HStack {
					Image(systemName: "medal")
					Text(group.mensagemLider)
						.font(.footnote)
						.lineLimit(1)
				}
				.foregroundColor(.textSecundary)
			}
			
			Image(systemName: "chevron.right")
				.foregroundColor(.primaryHover)
		}
	}
}

struct GroupCard_Previews: PreviewProvider {
	static var previews: some View {
		let group = MockGroupGenerator.mockGroup()
		GroupCard(group: group)
	}
}
