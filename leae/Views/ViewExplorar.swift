//
//  ViewExplorar.swift
//  leae
//
//  Created by Aluno 12 on 29/04/25.
//

import SwiftUI

struct ViewExplorar: View {
    var body: some View {
		ScrollView(.vertical, showsIndicators: false) {
			VStack(alignment: .leading, spacing: Spacing.betweenSections) {
				let sampleHeader: String = "Sample Section"
				let sampleBooks = [
					Livro(titulo: "SwiftUI Essentials", autor: "Apple", genero: "Tecnologia", sinopse: "Aprenda SwiftUI.", imagemCapa: "livro1"),
					Livro(titulo: "Clean Code", autor: "Robert C. Martin", genero: "Programação", sinopse: "Práticas de código limpo.", imagemCapa: "livro2")
				]
				
				BookCarousel(books: sampleBooks, header: sampleHeader)
				BookCarousel(books: sampleBooks, header: sampleHeader)
				BookCarousel(books: sampleBooks, header: sampleHeader)
				BookCarousel(books: sampleBooks, header: sampleHeader)
			}
		}
		.padding(.horizontal, Padding.mainScreen)
    }
}

struct ViewExplorar_Previews: PreviewProvider {
    static var previews: some View {
        ViewExplorar()
    }
}
