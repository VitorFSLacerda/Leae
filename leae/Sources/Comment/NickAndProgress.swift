//
//  NickAndProgress.swift
//  leae
//
//  Created by Aluno 12 on 05/05/25.
//

import SwiftUI

struct NickAndProgress: View {
	let comment: Comentario
	let userViewer = DatabaseManager.shared.getUser()
	var nickname: String = comment.usuario == userViewer ? userViewer?.apelido.append(" (você)") : comment.usuario.apelido
	
    var body: some View {
		HStack {
			Text(nickname)
				.foregroundColor(.textPrimary)
			Text("\(comment.progresso)%")
				.foregroundColor(.accentHighlight)
		}
			.font(.subheadline)
    }
}

struct NickAndProgress_Previews: PreviewProvider {
    static var previews: some View {
		let comment = MockCommentGenerator.mockComment()
        NickAndProgress(comment: comment)
    }
}
