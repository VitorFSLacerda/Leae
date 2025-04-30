import Foundation

class Usuario: Codable {
    private var _foto: String
    private var _apelido: String
    private var _nome: String
    private var _email: String
    private var _senha: String
    private var _comentarios: [Comentario]
    private var _livroAtual: Livro
    private var _gruposUsuario: [Grupo]
    private var _missoes: [Missao]

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

    // Inicializador padrão
    init(foto: String, apelido: String, nome: String, email: String, senha: String, livroAtual: Livro, gruposUsuario: [Grupo], missoes: [Missao], comentarios: [Comentario]) {
        self._foto = foto
        self._apelido = apelido
        self._nome = nome
        self._email = email
        self._senha = senha
        self._livroAtual = livroAtual
        self._gruposUsuario = gruposUsuario
        self._missoes = missoes
        self._comentarios = comentarios
    }

    // Decodificação
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        _foto = try container.decode(String.self, forKey: .foto)
        _apelido = try container.decode(String.self, forKey: .apelido)
        _nome = try container.decode(String.self, forKey: .nome)
        _email = try container.decode(String.self, forKey: .email)
        _senha = try container.decode(String.self, forKey: .senha)
        _comentarios = try container.decode([Comentario].self, forKey: .comentarios)
        _livroAtual = try container.decode(Livro.self, forKey: .livroAtual)
        _gruposUsuario = try container.decode([Grupo].self, forKey: .gruposUsuario)
        _missoes = try container.decode([Missao].self, forKey: .missoes)
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
    var foto: String {
        get { return _foto }
        set { _foto = newValue }
    }

    var apelido: String {
        get { return _apelido }
        set { _apelido = newValue }
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

    var comentarios: [Comentario] {
        get { return _comentarios }
        set { _comentarios = newValue }
    }
}
