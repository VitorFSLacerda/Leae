//
//  MockBook.swift
//  leae
//
//  Created by Aluno 12 on 06/05/25.
//

import Foundation

struct MockBookGenerator {
	static func MockBook(seed: Int) -> Livro {
		var i = seed
		if i > 5 {
			i %= 5
		}
		
		switch i {
		case 1:
			return Livro(
				titulo: "SwiftUI Essentials",
				autor: "Apple",
				genero: "Tecnologia",
				sinopse: "Aprenda SwiftUI.",
				imagemCapa: "livro1"
			)
		case 2:
			return Livro(
				titulo: "Clean Code",
				autor: "Robert C. Martin",
				genero: "Programação",
				sinopse: "Práticas para escrever código limpo e eficiente.",
				imagemCapa: "livro2"
			)
		case 3:
			return Livro(
				titulo: "O Senhor dos Anéis",
				autor: "J.R.R. Tolkien",
				genero: "Fantasia",
				sinopse: "A história épica de Frodo e a busca para destruir o Um Anel.",
				imagemCapa: "livro3"
			)
		case 4:
			return Livro(
				titulo: "Harry Potter e a Pedra Filosofal",
				autor: "J.K. Rowling",
				genero: "Fantasia",
				sinopse: "As aventuras de Harry Potter em Hogwarts.",
				imagemCapa: "livro4"
			)
		case 5:
			return Livro(
				titulo: "1984",
				autor: "George Orwell",
				genero: "Ficção Distópica",
				sinopse: "Um mundo controlado por um regime totalitário.",
				imagemCapa: "livro5"
			)
		case 6:
			return Livro(
				titulo: "O Pequeno Príncipe",
				autor: "Antoine de Saint-Exupéry",
				genero: "Infantil",
				sinopse: "Uma jornada poética sobre amizade e vida.",
				imagemCapa: "livro6"
			)
		case 7:
			return Livro(
				titulo: "Introdução ao Pensamento Computacional",
				autor: "Jeannette M. Wing",
				genero: "Ciência da Computação",
				sinopse: "Explora os fundamentos do pensamento computacional.",
				imagemCapa: "livro7"
			)
		case 8:
			return Livro(
				titulo: "O Alquimista",
				autor: "Paulo Coelho",
				genero: "Autoajuda",
				sinopse: "A jornada de Santiago em busca de seu destino pessoal.",
				imagemCapa: "livro8"
			)
		case 9:
			return Livro(
				titulo: "A Metamorfose",
				autor: "Franz Kafka",
				genero: "Ficção",
				sinopse: "A história de Gregor Samsa, que acorda transformado em um inseto.",
				imagemCapa: "livro9"
			)
		default:
			return Livro(
				titulo: "O Código Da Vinci",
				autor: "Dan Brown",
				genero: "Suspense",
				sinopse: "Um thriller envolvendo segredos históricos e mistérios religiosos.",
				imagemCapa: "livro10"
			)
		}
	}
	static func mockBookArray(count: Int) -> [Livro] {
		var i = count
		if i > 10{
			i %= 10
		}
		var books: [Livro] = []
		for _ in 0...i {
			books.append(MockBook(seed: i))
		}
		return books
	}
}
