//
//  NickAndProgress.swift
//  leae
//
//  Created by Aluno 12 on 05/05/25.
//

import SwiftUI

struct NickAndProgress: View {
	let comment: Comentario
	let userViewer = DatabaseManager.shared.getUser()
	var nickname: String = comment.usuario == userViewer ? userViewer?.apelido.append(" (você)") : comment.usuario.apelido
	
    var body: some View {
		HStack {
			Text(nickname)
				.foregroundColor(.textPrimary)
			Text("\(comment.progresso)%")
				.foregroundColor(.accentHighlight)
		}
			.font(.subheadline)
    }
}

struct NickAndProgress_Previews: PreviewProvider {
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
		
        NickAndProgress(comment: comentario1)
    }
}
