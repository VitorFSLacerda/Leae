//
//  GroupMock.swift
//  leae
//
//  Created by Aluno 12 on 06/05/25.
//

import Foundation

struct MockGroupGenerator {
	static func mockGroup() -> Grupo {
		let book = MockBookGenerator.MockBook(seed: Int.random(in: 0...10))
		
		var users: [Usuario] = []
		let numUsers = Int.random(in: 1...5)
		
		for i in 1...numUsers {
			users.append(MockUserGenerator.mockUserOnBook(seed: i, book: book))
		}
		
		let group = Grupo(
			nome: "Leitores de \(book.titulo)",
			descricao: "Grupo para discutir \(book.genero)",
			livro: book,
			usuarios: users,
			imagem: "grupo_\(book.titulo.lowercased())"
		)

		// Definindo o líder do grupo
		group.definirLider()
		
		return group
	}
}
