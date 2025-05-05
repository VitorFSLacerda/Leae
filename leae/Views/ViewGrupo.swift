//
//  ViewGrupo.swift
//  leae
//
//  Created by Aluno 12 on 05/05/25.
//

import SwiftUI

struct ViewGrupo: View {
	let group: Grupo
	@Environment(\.presentationMode) private var presentationMode
	
    var body: some View {
		NavigationView {
			ScrollView {
				VStack(alignment: .leading, spacing: Spacing.betweenSections) {
					HeaderOnGroup(group: group)
					LeaderCardOnGroup(group: group)
					DiscussionSectionOnGroup(group: group)
				}
			}
			.background(Color.backgroundBase)
		}
		.background(Color.primaryMuted)
		.navigationTitle(group.nome)
		.navigationBarTitleDisplayMode(.inline)
		.toolbar {
			ToolbarItem(placement: .navigationBarLeading) {
				Button(action: {
					presentationMode.wrappedValue.dismiss()
				}) {
					HStack {
						Image(systemName: "chevron.left")
						Text("Voltar")
					}
					.foregroundColor(.primaryHover)
				}
			}
		}
    }
}

struct ViewGrupo_Previews: PreviewProvider {
    static var previews: some View {
        ViewGrupo()
    }
}
