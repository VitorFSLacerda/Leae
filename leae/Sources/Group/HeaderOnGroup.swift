//
//  HeaderOnGroup.swift
//  leae
//
//  Created by Aluno 12 on 05/05/25.
//

import SwiftUI

struct HeaderOnGroup: View {
	let group: Grupo
    var body: some View {
		HStack(alignment: .center, spacing: Spacing.big) {
			Image(group.imagem)
				.resizable()
				.scaledToFill()
				.frame(width: CardSize.bigSquare, height: CardSize.bigSquare, alignment: .center)
				.cornerRadius(CornerRadius.medium)
				.clipped()
			VStack(alignment: .leading, spacing: Spacing.big) {
				Text(group.livro.titulo)
					.font(.body)
					.foregroundColor(.textPrimary)
					.lineLimit(1)
				Text(group.descricao)
					.font(.subheadline)
					.foregroundColor(.textSecundary)
					.lineLimit(3)
			}
		}
		.background(Color.primaryMuted)
    }
}

struct HeaderOnGroup_Previews: PreviewProvider {
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
		
        HeaderOnGroup(group: grupoMock)
    }
}
