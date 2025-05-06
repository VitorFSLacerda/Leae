//
//  MockComment.swift
//  leae
//
//  Created by Aluno 12 on 06/05/25.
//

import Foundation

struct MockCommentGenerator {
	static func mockComment() -> Comentario {
		let livro = MockBookGenerator.MockBook(seed: Int.random(in: 0...10))
		let seed = Int.random(in: 0...10)
		let usuario = MockUserGenerator.mockUserOnBook(seed: seed, book: livro)
		switch seed {
		case 1:
			return Comentario(
				livro: livro,
				usuario: usuario,
				texto: "Este livro é incrível! Recomendo a todos que querem aprender SwiftUI."
			)
		case 2:
			return Comentario(
				livro: livro,
				usuario: usuario,
				texto: "Muito bem escrito! Os exemplos são claros e fáceis de seguir."
			)
		case 3:
			return Comentario(
				livro: livro,
				usuario: usuario,
				texto: "Estou aprendendo muito com este livro. Vale cada centavo!"
			)
		case 4:
			return Comentario(
				livro: livro,
				usuario: usuario,
				texto: "O autor fez um ótimo trabalho explicando conceitos complexos."
			)
		case 5:
			return Comentario(
				livro: livro,
				usuario: usuario,
				texto: "Um ótimo recurso para iniciantes em programação."
			)
		case 6:
			return Comentario(
				livro: livro,
				usuario: usuario,
				texto: "Os capítulos são bem organizados e cobrem tudo o que você precisa saber."
			)
		case 7:
			return Comentario(
				livro: livro,
				usuario: usuario,
				texto: "Gostei especialmente dos exercícios práticos ao final de cada capítulo."
			)
		case 8:
			return Comentario(
				livro: livro,
				usuario: usuario,
				texto: "Este livro mudou minha perspectiva sobre desenvolvimento de software."
			)
		case 9:
			return Comentario(
				livro: livro,
				usuario: usuario,
				texto: "Recomendo para quem busca uma abordagem prática e direta."
			)
		default:
			return Comentario(
				livro: livro,
				usuario: usuario,
				texto: "Excelente leitura! Obrigado ao autor por compartilhar seu conhecimento."
			)
		}
	}
}
