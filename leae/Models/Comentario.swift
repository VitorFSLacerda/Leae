import Foundation

class Comentario: Codable, Identifiable {
    
<<<<<<< HEAD
    private let _id = UUID()
=======
<<<<<<< HEAD
	private let _id = UUID()
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c
    private var _livro: Livro
    private var _usuario: Usuario
=======
    private let _livro: Livro
    private let _usuario: Usuario
    private let _data: Date // data de postagem
    private let _progresso: Int // progresso na leitura em %
    private var _texto: String
>>>>>>> 4c153f2d282555321b20d8159ac3a9142bdc1a17
    private var _curtidas: Int
    private var _comentarios: [Comentario]
    
<<<<<<< HEAD
    init(livro: Livro, usuario: Usuario, texto: String, curtidas: Int = 0, comentarios: [Comentario] = []) {
=======

    init(livro: Livro, usuario: Usuario, texto: String) {
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c
        self._livro = livro
        self._usuario = usuario
        self._data = Date()
        self._progresso = usuario.progressoEmLivro(livro) ?? 0
        self._texto = texto
        self._curtidas = 0
        self._comentarios = []
    }
    
    // MARK: - Identifiable
    var id: UUID {
        return _id
    }
    
    // MARK: - Propriedades
    
    var livro: Livro {
        get { return _livro }
    }
    
    var usuario: Usuario {
        get { return _usuario }
    }

    var data: Date {
        get { return _data }
    }

    var progresso: Int {
        get { return _progresso }
        set { _progresso = newValue }
    }
    
    var curtidas: Int {
        get { return _curtidas }
        set { _curtidas = newValue }
    }
    
    var comentarios: [Comentario] {
        get { return _comentarios }
        set { _comentarios = newValue }
    }
    
    var texto: String {
        get { return _texto }
        set { _texto = newValue }
    }
<<<<<<< HEAD
    
    // MARK: - Métodos
=======

        // Método para formatar a data como string
    func dataFormatada() -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium // Exemplo: "Nov 23, 2023"
        formatter.timeStyle = .short // Exemplo: "3:45 PM"
        return formatter.string(from: _data)
    }
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c
    
    func adicionarComentario(_ comentario: Comentario) {
        _comentarios.append(comentario)
    }
    
    func curtir() {
        _curtidas += 1
    }
    
    func descurtir() {
        if _curtidas > 0 {
            _curtidas -= 1
        }
    }
}
