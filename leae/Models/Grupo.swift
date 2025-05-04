import Foundation

class Grupo {
    // Propriedades privadas
    private var _nome: String
    private var _descricao: String
    private var _imagem: String
    private var _livro: Livro
    private var _usuarios: [Usuario]

    // Construtor
    init(nome: String, descricao: String, livro: Livro, usuarios: [Usuario] = [], imagem: String) {
        self._nome = nome
        self._descricao = descricao
        self._livro = livro
        self._usuarios = usuarios
        self._imagem = imagem
    }

    // Getter e Setter para `_nome`
    var nome: String {
        get { return _nome }
        set { _nome = newValue }
    }

    // Getter e Setter para `_descricao`
    var descricao: String {
        get { return _descricao }
        set { _descricao = newValue }
    }

    // Getter e Setter para `_livro`
    var livro: Livro {
        get { return _livro }
        set { _livro = newValue }
    }

    // Getter e Setter para `_usuarios`
    var usuarios: [Usuario] {
        get { return _usuarios }
        set { _usuarios = newValue }
    }

    // Getter e Setter para `_imagem`
    var imagem: String {
        get { return _imagem }
        set { _imagem = newValue }
    }

    // Método para adicionar um usuário ao grupo
    func adicionarUsuario(_ usuario: Usuario) {
        _usuarios.append(usuario)
    }

    // Método para remover um usuário do grupo
    func removerUsuario(_ usuario: Usuario) {
        _usuarios = _usuarios.filter { $0 !== usuario } // Remove o usuário se ele existir
    }
}