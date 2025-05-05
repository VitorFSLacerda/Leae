import Foundation
import SwiftUI

class UsuarioViewModel: ObservableObject {
    @Published var usuario: Usuario

    init(usuario: Usuario) {
        self.usuario = usuario
    }

    var foto: String {
        usuario.foto ?? "default_photo"
    }

    var apelido: String {
        usuario.apelido
    }

    var nome: String {
        usuario.nome ?? "Nome não definido"
    }

    var email: String {
        usuario.email ?? "E-mail não definido"
    }

    var livroAtualTitulo: String {
        usuario.livroAtual?.titulo ?? "Nenhum livro atual"
    }

    var grupos: [Grupo] {
        usuario.gruposUsuario
    }

    var missoes: [Missao] {
        usuario.gruposUsuario.flatMap { $0.missao }
    }

    func atualizarFoto(_ novaFoto: String) {
        usuario.foto = novaFoto
    }

    func atualizarApelido(_ novoApelido: String) {
        usuario.apelido = novoApelido
    }

    func atualizarNome(_ novoNome: String) {
        usuario.nome = novoNome
    }

    func atualizarEmail(_ novoEmail: String) {
        usuario.email = novoEmail
    }

    func atualizarSenha(_ novaSenha: String) {
        usuario.senha = novaSenha
    }

    func adicionarGrupo(_ grupo: Grupo) {
        usuario.gruposUsuario.append(grupo)
    }

    func atualizarLivroAtual(_ livro: Livro) {
        usuario.livroAtual = livro
    }
}
