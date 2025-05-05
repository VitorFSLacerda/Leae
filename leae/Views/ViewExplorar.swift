//
//  ViewExplorar.swift
//  leae
//
//  Created by Aluno 12 on 29/04/25.
//

import SwiftUI

struct ViewExplorar: View {
	// Mock data for books and reviews
	let sampleBookHeader: [String] = [
		"Para você",
		"Destaques da galera",
		"Baseado nos seu interesses",
		"Baseados em fatos reais"
	]
	let sampleReviewHeader: [String] = [
		"Resenhas interessantes",
		"As mais curtidas"
	]
	let sampleUsers: [Usuario]
	let sampleBooks: [Livro]
	let sampleReviewTexts: [String]
	let sampleReviews: [Resenha]

	init() {
		// Inicializa os dados de exemplo
		self.sampleUsers = [
			Usuario(apelido: "@xpredoiv"),
			Usuario(apelido: "@maria_dorineves")
		]
		self.sampleBooks = [
			Livro(titulo: "SwiftUI Essentials", autor: "Apple", genero: "Tecnologia", sinopse: "Aprenda SwiftUI.", imagemCapa: "livro1"),
			Livro(titulo: "Clean Code", autor: "Robert C. Martin", genero: "Programação", sinopse: "Práticas de código limpo.", imagemCapa: "livro2"),
			Livro(titulo: "O Hobbit", autor: "J.R.R. Tolkien", genero: "Fantasia", sinopse: "A aventura de Bilbo Bolseiro em busca do tesouro dos dragões.", imagemCapa: "livro3"),
			Livro(titulo: "O Poder do Hábito", autor: "Charles Duhigg", genero: "Autoajuda", sinopse: "Entenda como os hábitos funcionam e como transformá-los.", imagemCapa: "livro4"),
			Livro(titulo: "Harry Potter e a Pedra Filosofal", autor: "J.K. Rowling", genero: "Fantasia", sinopse: "A história de Harry Potter em seu primeiro ano em Hogwarts.", imagemCapa: "livro5"),
			Livro(titulo: "Introdução ao Pensamento Computacional", autor: "Paulo Silva", genero: "Educação", sinopse: "Uma introdução prática ao pensamento computacional e lógica de programação.", imagemCapa: "livro6")
		]

		self.sampleReviewTexts = [
			"Esse final acabou comigo 🥲 Alguém mais aí precisando de terapia depois dessa leitura?",
			"Li por indicação daqui e amei! Que comunidade maravilhosa!"
		]

		// Inicializa as resenhas usando os dados já criados
		self.sampleReviews = [
			Resenha(livro: self.sampleBooks[0], usuario: self.sampleUsers[0], texto: self.sampleReviewTexts[0], curtidas: 0, comentarios: [], avaliacao: 3.633),
			Resenha(livro: self.sampleBooks[1], usuario: self.sampleUsers[1], texto: self.sampleReviewTexts[1], curtidas: 3, comentarios: [], avaliacao: 4.32)
		]
	}
	
    var body: some View {
		NavigationView {
			ScrollView(.vertical, showsIndicators: false) {
				VStack(alignment: .leading, spacing: Spacing.betweenSections) {
					SearchField()
					BookCarousel(books: sampleBooks, header: sampleBookHeader[0])
					BookCarousel(books: sampleBooks, header: sampleBookHeader[1])
					ReviewCarousel(reviews: sampleReviews, header: sampleReviewHeader[0])
					BookCarousel(books: sampleBooks, header: sampleBookHeader[2])
					BookCarousel(books: sampleBooks, header: sampleBookHeader[3])
					ReviewCarousel(reviews: sampleReviews, header: sampleReviewHeader[1])
				}
			}
			.padding(.horizontal, Padding.mainScreen)
			.navigationTitle("Explorar")
		}
		.toolbar {
			ToolbarItem(placement: .navigationBarTrailing) {
				Image(systemName: "bell")
			}
		}
		.tabItem {
			Label("Explorar", systemImage: "magnifyingglass")
		}
    }
}

struct ViewExplorar_Previews: PreviewProvider {
    static var previews: some View {
        ViewExplorar()
    }
}
