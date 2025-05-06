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
		let group = MockGroupGenerator.mockGroup()
        HeaderOnGroup(group: group)
    }
}
