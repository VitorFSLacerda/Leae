//
//  CommentOnGroup.swift
//  leae
//
//  Created by Aluno 12 on 05/05/25.
//

import SwiftUI

struct CommentOnGroup: View {
	let comment: Comentario
	
    var body: some View {
		VStack {
			NickAndProgress(comment: comment)
			Text(comment.texto)
				.font(.caption)
				.foregroundColor(.textPrimary)
		}
    }
}

struct CommentOnGroup_Previews: PreviewProvider {
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
        CommentOnGroup(comment: comentario1)
    }
}
