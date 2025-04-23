import Foundation

class Usuario {
    
    var nome: String
    var email: String
    var senha: String
    var livroAtual: Livros
    var gruposUsuario: [Grupo]
    
    init(nome: String, email: String, senha: String, livroAtual: Livros, gruposUsuario: [Grupo]) {
            self.nome = nome
            self.email = email
            self.senha = senha
            self.livroAtual = livroAtual
            self.gruposUsuario = gruposUsuario
    }

}
