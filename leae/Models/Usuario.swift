import Foundation

<<<<<<< HEAD
class Usuario: Codable {
<<<<<<< HEAD
    private var _foto: String?
    private var _apelido: String
    private var _nome: String?
    private var _email: String?
    private var _senha: String?
    private var _comentarios: [Comentario] = []
    private var _livroAtual: Livro?
    private var _gruposUsuario: [Grupo] = []
    private var _missoes: [Missao] = []
=======
    private var _foto: String
=======
class Usuario {
    // Propriedades privadas
    private var _foto: String?
>>>>>>> 4c153f2d282555321b20d8159ac3a9142bdc1a17
    private var _apelido: String
    private var _nome: String
    private var _email: String
    private var _senha: String
    private var _comentarios: [Comentario]
<<<<<<< HEAD
    private var _livroAtual: Livro
    private var _gruposUsuario: [Grupo]
    private var _missoes: [Missao]
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c

    // Enum para definir as chaves de codificação/decodificação
    private enum CodingKeys: String, CodingKey {
        case foto = "_foto"
        case apelido = "_apelido"
        case nome = "_nome"
        case email = "_email"
        case senha = "_senha"
        case comentarios = "_comentarios"
        case livroAtual = "_livroAtual"
        case gruposUsuario = "_gruposUsuario"
        case missoes = "_missoes"
    }

    // Inicializador principal
    init(apelido: String) {
        self._apelido = apelido
    }

    // Inicializador completo
    init(foto: String?, apelido: String, nome: String?, email: String?, senha: String?, livroAtual: Livro?, gruposUsuario: [Grupo], missoes: [Missao], comentarios: [Comentario]) {
        self._foto = foto
=======
    private var _leituras: [Livro: Int]
    private var _livroAtual: Livro?
    private var _grupos: [Grupo]

    // Construtor
    init(apelido: String, nome: String, email: String, senha: String) {
        self._foto = nil
>>>>>>> 4c153f2d282555321b20d8159ac3a9142bdc1a17
        self._apelido = apelido
        self._nome = nome
        self._email = email
        self._senha = senha
<<<<<<< HEAD
        self._comentarios = comentarios
        self._livroAtual = livroAtual
        self._gruposUsuario = gruposUsuario
        self._missoes = missoes
    }
=======
        self._comentarios = []
        self._leituras = [:]
        self._livroAtual = nil
        self._grupos = []
    }
<<<<<<< HEAD
<<<<<<< HEAD
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c

    // Decodificação
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _foto = try container.decodeIfPresent(String.self, forKey: .foto)
        _apelido = try container.decode(String.self, forKey: .apelido)
        _nome = try container.decodeIfPresent(String.self, forKey: .nome)
        _email = try container.decodeIfPresent(String.self, forKey: .email)
        _senha = try container.decodeIfPresent(String.self, forKey: .senha)
        _comentarios = try container.decodeIfPresent([Comentario].self, forKey: .comentarios) ?? []
        _livroAtual = try container.decodeIfPresent(Livro.self, forKey: .livroAtual)
        _gruposUsuario = try container.decodeIfPresent([Grupo].self, forKey: .gruposUsuario) ?? []
        _missoes = try container.decodeIfPresent([Missao].self, forKey: .missoes) ?? []
    }

    // Codificação
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(_foto, forKey: .foto)
        try container.encode(_apelido, forKey: .apelido)
        try container.encode(_nome, forKey: .nome)
        try container.encode(_email, forKey: .email)
        try container.encode(_senha, forKey: .senha)
        try container.encode(_comentarios, forKey: .comentarios)
        try container.encode(_livroAtual, forKey: .livroAtual)
        try container.encode(_gruposUsuario, forKey: .gruposUsuario)
        try container.encode(_missoes, forKey: .missoes)
    }

    // Getters e setters...
<<<<<<< HEAD
    var foto: String? {
=======
    var foto: String {
=======

    // Getter e Setter para `_foto`
    var foto: String? {
>>>>>>> 4c153f2d282555321b20d8159ac3a9142bdc1a17
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c
        get { return _foto }
        set { _foto = newValue }
    }

<<<<<<< HEAD
    var apelido: String {
        get { return _apelido }
        set { _apelido = newValue }
    }

    var nome: String? {
=======
<<<<<<< HEAD
	var apelido: String {
		get { return _apelido }
		set { _apelido = newValue }
	}

<<<<<<< HEAD
=======
    // Getter e Setter para `_apelido`
    var apelido: String {
        get { return _apelido }
        set { _apelido = newValue }
    }

    // Getter e Setter para `_nome`
>>>>>>> 4c153f2d282555321b20d8159ac3a9142bdc1a17
    var nome: String {
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c
        get { return _nome }
        set { _nome = newValue }
    }

<<<<<<< HEAD
    var email: String? {
=======
<<<<<<< HEAD
=======
    // Getter e Setter para `_email`
>>>>>>> 4c153f2d282555321b20d8159ac3a9142bdc1a17
    var email: String {
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c
        get { return _email }
        set { _email = newValue }
    }

<<<<<<< HEAD
    var senha: String? {
=======
<<<<<<< HEAD
=======
    // Getter e Setter para `_senha`
>>>>>>> 4c153f2d282555321b20d8159ac3a9142bdc1a17
    var senha: String {
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c
        get { return _senha }
        set { _senha = newValue }
    }

<<<<<<< HEAD
    var livroAtual: Livro? {
=======
<<<<<<< HEAD
    var livroAtual: Livro {
=======
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
>>>>>>> 4c153f2d282555321b20d8159ac3a9142bdc1a17
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c
        get { return _livroAtual }
        set { _livroAtual = newValue }
    }

<<<<<<< HEAD
    var gruposUsuario: [Grupo] {
        get { return _gruposUsuario }
        set { _gruposUsuario = newValue }
    }

    var missoes: [Missao] {
        get { return _missoes }
        set { _missoes = newValue }
    }

    var comentarios: [Comentario] {
        get { return _comentarios }
        set { _comentarios = newValue }
    }
}
=======
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
        _comentarios.sort { c1, c2 in
            return c1.data > c2.data
        }
    }

    // Método para adicionar um grupo
    func adicionarGrupo(_ grupo: Grupo) {
        _grupos.append(grupo)
    }
}
>>>>>>> 4c153f2d282555321b20d8159ac3a9142bdc1a17
