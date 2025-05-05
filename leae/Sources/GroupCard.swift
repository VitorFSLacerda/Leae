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
					.font(.callout.fontWeight(.bold))
					.foregroundColor(.textPrimary)
				Text(group.livro.titulo)
					.font(.subheadline)
					.foregroundColor(.textSecundary)
					.lineLimit(1)
				HStack {
					//icone de medalha
					Text(group.mensagemLider)
						.font(.footnote)
						.foregroundColor(.textSecundary)
						.lineLimit(1)
				}
			}

			//icone de seta para direita
			//	.foregroundColor(.primaryHover)
		}
	}
}

struct GroupCard_Previews: PreviewProvider {
	static var previews: some View {
		// Criando livros mock
		let livro1 = Livro(
			titulo: "SwiftUI Essentials",
			autor: "Apple",
			genero: "Tecnologia",
			sinopse: "Aprenda SwiftUI.",
			imagemCapa: "livro1"
		)

		// Criando usuários mock
		let usuario1 = Usuario(
			apelido: "@xpredoiv",
			nome: "João Silva",
			email: "joao@example.com",
			senha: "senha123"
		)

		let usuario2 = Usuario(
			apelido: "@maria_dorineves",
			nome: "Maria Dorineves",
			email: "maria@example.com",
			senha: "senha456"
		)

		// Atualizando progresso de leitura dos usuários
		usuario1.atualizarProgresso(livro: livro1, porcentagemLida: 50)
		usuario2.atualizarProgresso(livro: livro1, porcentagemLida: 80)

		// Criando grupo mock
		let grupoMock = Grupo(
			nome: "Leitores de SwiftUI",
			descricao: "Grupo para discutir SwiftUI",
			livro: livro1,
			usuarios: [usuario1, usuario2],
			imagem: "grupo_swiftui"
		)

		// Definindo o líder do grupo
		grupoMock.definirLider()

		GroupCard()
	}
}