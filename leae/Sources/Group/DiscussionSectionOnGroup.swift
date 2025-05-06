//
//  DiscussionSectionOnGroup.swift
//  leae
//
//  Created by Aluno 12 on 05/05/25.
//

import SwiftUI

struct DiscussionSectionOnGroup: View {
	let group: Grupo
    var body: some View {
		VStack(alignment: .leading, spacing: Spacing.titleSepBody) {
			// Header
			Text("Discussão")
				.font(.title)
				.foregroundColor(.textPrimary)
			// Body
			VStack(alignment: .leading, spacing: Spacing.betweenItems) {
				ForEach(group.comentarios) { comment in
					CommentOnGroup(comment: comment)
				}
			}
		}
    }
}

struct DiscussionSectionOnGroup_Previews: PreviewProvider {
    static var previews: some View {
		let group = MockGroupGenerator.mockGroup()
        DiscussionSectionOnGroup(group: group)
    }
}
