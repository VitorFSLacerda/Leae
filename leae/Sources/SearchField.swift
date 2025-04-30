//
//  SearchField.swift
//  leae
//
//  Created by Aluno 12 on 30/04/25.
//

import SwiftUI

struct SearchField: View {
    var body: some View {
		HStack(alignment: .center, spacing: Spacing.small) {
		  Image(systemName: "magnifyingglass")
		  TextField("Pesquisar", text: .constant(""))
			.textFieldStyle(PlainTextFieldStyle())
			.font(.body)
		  Button(action: {}) {
			Image(systemName: "mic.fill")
		  }
		}
		.foregroundColor(.textMuted)
		.padding(Padding.small)
		.background(Color.backgroundMuted)
		.cornerRadius(CornerRadius.medium)
    }
}

struct SearchField_Previews: PreviewProvider {
    static var previews: some View {
        SearchField()
    }
}
