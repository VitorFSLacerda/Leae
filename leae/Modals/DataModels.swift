// DataModels.swift
import Foundation

// Representação do Livro
struct Livro: Codable {
    let titulo: String
    let autor: String
    let genero: String
    let sinopse: String
    let imagemCapa: String
    
    private enum CodingKeys: String, CodingKey {
        case titulo = "_titulo"
        case autor = "_autor"
        case genero = "_genero"
        case sinopse = "_sinopse"
        case imagemCapa = "_imagemCapa"
    }
}

// Representação da Missão
struct Missao: Codable {
    let descricao: String
    let pontuacao: String
    let tipo: String
    let meta: Int
    let progresso: Int
    
    private enum CodingKeys: String, CodingKey {
        case descricao = "_descricao"
        case pontuacao = "_pontuacao"
        case tipo = "_tipo"
        case meta = "_meta"
        case progresso = "_progresso"
    }
}

// Representação do Comentário
struct Comentario: Codable {
    let texto: String
    let livro: Livro
    let usuario: Usuario
    
    private enum CodingKeys: String, CodingKey {
        case texto = "_texto"
        case livro = "_livro"
        case usuario = "_usuario"
    }
}

// Representação do Grupo
struct Grupo: Codable {
    let livroGrupo: Livro
    let usuariosGrupo: [Usuario]
    let missao: [Missao]
    
    private enum CodingKeys: String, CodingKey {
        case livroGrupo = "_livroGrupo"
        case usuariosGrupo = "_usuariosGrupo"
        case missao = "_missao"
    }
}

// Representação do Usuário
struct Usuario: Codable {
    let nome: String
    let email: String
    let senha: String
    let foto: String
    let apelido: String
    let livroAtual: Livro
    let gruposUsuario: [Grupo]
    let missoes: [Missao]
    let comentarios: [Comentario]
    
    private enum CodingKeys: String, CodingKey {
        case nome = "_nome"
        case email = "_email"
        case senha = "_senha"
        case foto = "_foto"
        case apelido = "_apelido"
        case livroAtual = "_livroAtual"
        case gruposUsuario = "_gruposUsuario"
        case missoes = "_missoes"
        case comentarios = "_comentarios"
    }
}
