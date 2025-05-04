import Foundation

class Grupo {
    // Propriedades privadas
    private var _nome: String
    private var _descricao: String
    private var _livro: Livro
    private var _usuarios: [Usuario]
    private var _imagem: String // Caminho da imagem
    private var _lider: Usuario? // Novo atributo opcional para o líder

    // Construtor
    init(nome: String, descricao: String, livro: Livro, usuarios: [Usuario] = [], imagem: String) {
        self._nome = nome
        self._descricao = descricao
        self._livro = livro
        self._usuarios = usuarios
        self._imagem = imagem
        self._lider = nil // Inicialmente, o líder é nulo
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

    // Getter e Setter para `_lider`
    var lider: Usuario? {
        get { return _lider }
        set { _lider = newValue }
    }

    // Método para adicionar um usuário ao grupo
    func adicionarUsuario(_ usuario: Usuario) {
        _usuarios.append(usuario)
        // Atualiza o líder automaticamente após adicionar um novo usuário
        definirLider()
    }

    // Método para remover um usuário do grupo
    func removerUsuario(_ usuario: Usuario) {
        _usuarios = _usuarios.filter { $0 !== usuario } // Remove o usuário se ele existir
        // Atualiza o líder automaticamente após remover um usuário
        definirLider()
    }

    // Método para definir o líder com base no progresso de leitura
    func definirLider() {
        _lider = _usuarios.max { u1, u2 in
            // Comparar o progresso de leitura dos usuários no livro do grupo
            return (u1.livroAtual?.porcentagemLido ?? 0) < (u2.livroAtual?.porcentagemLido ?? 0)
        }
    }
}