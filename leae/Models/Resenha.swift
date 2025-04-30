//
//  Resenha.swift
//  leae
//
//  Created by Aluno 12 on 30/04/25.
//

import Foundation

class Resenha: Comentario {
	private var _avaliacao: Double
	
	override init(livro: Livro, usuario: Usuario, texto: String, curtidas: Int = 0, comentarios: [Comentario] = [], avaliacao: Double) {
		super.init(livro: livro, usuario: usuario, texto: texto, curtidas: curtidas, comentarios: comentarios)
		self._avaliacao = avaliacao
	}
	
	var avaliacao: Double {
		get { return _avaliacao }
		set { _avaliacao = newValue }
	}
}
