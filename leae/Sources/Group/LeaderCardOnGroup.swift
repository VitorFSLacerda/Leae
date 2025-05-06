//
//  LeaderCardOnGroup.swift
//  leae
//
//  Created by Aluno 12 on 05/05/25.
//

import SwiftUI

struct LeaderCardOnGroup: View {
	let group: Grupo
    var body: some View {
		HStack(alignment: .center, spacing: Spacing.betweenItems) {
			Image(systemName: "medal")
			Text(group.mensagemLider)
				.font(.body)
		}
		.foregroundColor(.accentHighlight)
		.background(Color.secundaryBackground)
		.cornerRadius(CornerRadius.medium)
    }
}

struct LeaderCardOnGroup_Previews: PreviewProvider {
    static var previews: some View {
        LeaderCardOnGroup()
    }
}
