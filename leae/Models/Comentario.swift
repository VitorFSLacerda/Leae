import Foundation

class Comentario: Codable, Identifiable {

	private let _id = UUID()
    private var _livro: Livro
    private var _usuario: Usuario
    private let _livro: Livro
    private let _usuario: Usuario
    private let _data: Date // data de postagem
    private let _progresso: Int // progresso na leitura em %
    private var _texto: String
    private var _curtidas: Int
    private var _comentarios: [Comentario]
    

    init(livro: Livro, usuario: Usuario, texto: String) {
        self._livro = livro
        self._usuario = usuario
        self._data = Date()
        self._progresso = usuario.progressoEmLivro(livro) ?? 0
        self._texto = texto
        self._curtidas = 0
        self._comentarios = []
    }
	
	
	var id: UUID {
		get { return _id }
	}
    
	
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

        // Método para formatar a data como string
    func dataFormatada() -> String {
        let formatter: DateFormatter = DateFormatter()
        formatter.dateStyle = .medium // Exemplo: "Nov 23, 2023"
        formatter.timeStyle = .short // Exemplo: "3:45 PM"
        return formatter.string(from: _data)
    }
    
    // Função para adicionar um comentário à lista de comentários
    func adicionarComentario(_ comentario: Comentario) {
        _comentarios.append(comentario)
    }
    
    // Função para aumentar a quantidade de curtidas
    func curtir() {
        _curtidas += 1
    }
    
    // Função para diminuir a quantidade de curtidas
    func descurtir() {
        if _curtidas > 0 {
            _curtidas -= 1
        }
    }
}
