import Foundation

class Usuario {
    // Propriedades privadas
    private var _foto: String?
    private var _apelido: String
    private var _nome: String
    private var _email: String
    private var _senha: String
    private var _comentarios: [Comentario]
    private var _leituras: [Livro: Int]
    private var _livroAtual: Livro?
    private var _grupos: [Grupo]

    // Construtor
    init(apelido: String, nome: String, email: String, senha: String) {
        self._foto = nil
        self._apelido = apelido
        self._nome = nome
        self._email = email
        self._senha = senha
        self._comentarios = []
        self._leituras = [:]
        self._livroAtual = nil
        self._grupos = []
    }

    // Getter e Setter para `_foto`
    var foto: String? {
        get { return _foto }
        set { _foto = newValue }
    }

    // Getter e Setter para `_apelido`
    var apelido: String {
        get { return _apelido }
        set { _apelido = newValue }
    }

    // Getter e Setter para `_nome`
    var nome: String {
        get { return _nome }
        set { _nome = newValue }
    }

    // Getter e Setter para `_email`
    var email: String {
        get { return _email }
        set { _email = newValue }
    }

    // Getter e Setter para `_senha`
    var senha: String {
        get { return _senha }
        set { _senha = newValue }
    }

    // Getter para `_comentarios`
    var comentarios: [Comentario] {
        get { return _comentarios }
        set { _comentarios = newValue }
    }

    // Getter para `_grupos`
    var grupos: [Grupo] {
        get { return _grupos }
        set { _grupos = newValue }
    }

    // Getter para `_livroAtual`
    var livroAtual: Livro? {
        get { return _livroAtual }
        set { _livroAtual = newValue }
    }

    // Método para definir o progresso de leitura de um livro
    func atualizarProgresso(livro: Livro, porcentagemLida: Int) {
        guard porcentagemLida >= 0 && porcentagemLida <= 100 else {
            print("Erro: A porcentagem lida deve estar entre 0 e 100.")
            return
        }
        _leituras[livro] = porcentagemLida
    }

    // Método para obter o progresso de leitura de um livro específico
    func progressoEmLivro(_ livro: Livro) -> Int? {
        return _leituras[livro]
    }

    // Método para remover o progresso de leitura de um livro
    func removerProgresso(livro: Livro) {
        _leituras.removeValue(forKey: livro)
    }

    // Método para listar todos os livros com progresso
    func listarProgresso() -> [(Livro, Int)] {
        return Array(_leituras)
    }

    // Propriedade computada para o livro atual (livro com maior progresso)
    var livroMaisLido: (Livro, Int)? {
        return _leituras.max { a, b in
            return a.value < b.value
        }
    }

    // Método para adicionar um comentário
    func adicionarComentario(_ comentario: Comentario) {
        _comentarios.append(comentario)
    }

    // Método para adicionar um grupo
    func adicionarGrupo(_ grupo: Grupo) {
        _grupos.append(grupo)
    }
}