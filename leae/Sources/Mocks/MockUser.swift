//
//  MockUser.swift
//  leae
//
//  Created by Aluno 12 on 06/05/25.
//

import Foundation

struct  MockUserGenerator {
	static func mockUser(seed: Int) -> Usuario {
		var i = seed
		if i > 5 {
			i %= 5
		}
		
		switch i {
		case 1:
			return Usuario(
				apelido: "@xpredoiv",
				nome: "João Silva",
				email: "joao@example.com",
				senha: "senha123"
			)
		case 2:
			return Usuario(
				apelido: "@maria_dorineves",
				nome: "Maria Dorineves",
				email: "maria@example.com",
				senha: "senha456"
			)
		case 3:
			return Usuario(
				apelido: "@augusto_villa",
				nome: "Augusto Villa",
				email: "augusto@example.com",
				senha: "senha789"
			)
		case 4:
			return Usuario(
				apelido: "@ana_banana",
				nome: "Ana Banana",
				email: "ana@example.com",
				senha: "senhaabc"
			)
		default:
			return Usuario(
				apelido: "@lucas_nunes",
				nome: "Lucas Nunes",
				email: "lucas@example.com",
				senha: "senhalucas"
			)
		}
	}
	
	static func mockUserOnBook(seed: Int, book: Livro) -> Usuario {
		let user = mockUser(seed: seed)
		let randomProgress = Int.random(in: 0...100)
		user.atualizarProgresso(livro: book, porcentagemLida: randomProgress)
		return user
	}
}
