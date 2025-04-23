import Foundation

class Usuario {
    
    private var _nome: String
    private var _email: String
    private var _senha: String
    private var _livroAtual: Livro
    private var _gruposUsuario: [Grupo]
    private var _missoes: [Missao]
    
    init(nome: String, email: String, senha: String, livroAtual: Livro, gruposUsuario: [Grupo], missoes: [Missao]) {
        self._nome = nome
        self._email = email
        self._senha = senha
        self._livroAtual = livroAtual
        self._gruposUsuario = gruposUsuario
        self._missoes = missoes
    }
    
    var nome: String {
        get { return _nome }
        set { _nome = newValue }
    }
    
    var email: String {
        get { return _email }
        set { _email = newValue }
    }
    
    var senha: String {
        get { return _senha }
        set { _senha = newValue }
    }
    
    var livroAtual: Livro {
        get { return _livroAtual }
        set { _livroAtual = newValue }
    }
    
    var gruposUsuario: [Grupo] {
        get { return _gruposUsuario }
        set { _gruposUsuario = newValue }
    }
    
    var missoes: [Missao] {
        get { return _missoes }
        set { _missoes = newValue }
    }
}
