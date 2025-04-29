//
//  BookCarousel.swift
//  leae
//
//  Created by Aluno 12 on 29/04/25.
//

import SwiftUI

struct BookCard: View {
	let book: Livro
	
	var body: some View {
		VStack(alignment: .center, spacing: Spacing.bookcoverSepTitle) {
			Image(book.imagemCapa)
				.resizable()
				.scaledToFill()
				.frame(width: CardSize.smallWidth, height: CardSize.smallHeight, alignment: .center)
				.cornerRadius(CornerRadius.small)
				.clipped()
				
			Text(book.titulo)
				.frame(width: TitleBoxSize.smallWidth, height: TitleBoxSize.smallHeight, alignment: .center)
				.font(.footnote)
				.foregroundColor(.textPrimary)
				.lineLimit(LineLimit.bookTitle)
				.multilineTextAlignment(.center)
		}
		.padding(0.0)
	}
}

struct BookCarousel: View {
	let books: [Livro]
	let header: String
	var body: some View {
		VStack(alignment: .leading, spacing: Spacing.titleSepBody) {
			Text(header)
				.frame(width: TitleBoxSize.sectionHeaderWidth, height: TitleBoxSize.sectionHeaderHeight, alignment: .leading)
				.font(.title2)
				.foregroundColor(.textPrimary)
				.lineLimit(LineLimit.sectionHeader)
			
			ScrollView(.horizontal, showsIndicators: false) {
				HStack(spacing: Spacing.betweenItems) {
					ForEach(books) { book in
						BookCard(book: book)
					}
				}
				.padding(0.0)
			}
		}
	}
}

struct BookCarousel_Previews: PreviewProvider {
    static var previews: some View {
		let sampleHeader: String = "Sample Section"
		let sampleBooks = [
			Livro(titulo: "SwiftUI Essentials", autor: "Apple", genero: "Tecnologia", sinopse: "Aprenda SwiftUI.", imagemCapa: "livro1"),
			Livro(titulo: "Clean Code", autor: "Robert C. Martin", genero: "Programação", sinopse: "Práticas de código limpo.", imagemCapa: "livro2")
		]
        BookCarousel(books: sampleBooks, header: sampleHeader)
    }
}
