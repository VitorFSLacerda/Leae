import Foundation

<<<<<<< HEAD
class Livro: Codable, Identifiable {
    
    private let _id = UUID()
=======
<<<<<<< HEAD
class Livro: Codable {
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c
    
    private var _titulo: String
    private var _autor: String
    private var _genero: String
    private var _sinopse: String
    private var _imagemCapa: String
    private var _porcentagemLido: Int

    init(titulo: String, autor: String, genero: String, sinopse: String, imagemCapa: String) {
        self._titulo = titulo
        self._autor = autor
        self._genero = genero
        self._sinopse = sinopse
        self._imagemCapa = imagemCapa
        self._porcentagemLido = 0
    }

    var id: UUID {
        get { return _id }
    }

    var titulo: String {
        get { return _titulo }
        set { _titulo = newValue }
    }

    var autor: String {
        get { return _autor }
        set { _autor = newValue }
    }

    var genero: String {
        get { return _genero }
        set { _genero = newValue }
    }

    var sinopse: String {
        get { return _sinopse }
        set { _sinopse = newValue }
    }

    var imagemCapa: String {
        get { return _imagemCapa }
        set { _imagemCapa = newValue }
    }

    var porcentagemLido: Int {
        get { return _porcentagemLido }
        set { _porcentagemLido = newValue }
    }
<<<<<<< HEAD
=======
class Livro: Identifiable {
=======
class Livro: Identifiable, Equatable {
>>>>>>> 4c153f2d282555321b20d8159ac3a9142bdc1a17
	
	private let _id = UUID()
	private var _titulo: String
	private var _autor: String
	private var _genero: String
	private var _sinopse: String
	private var _imagemCapa: String

	init(titulo: String, autor: String, genero: String, sinopse: String, imagemCapa: String) {
		self._titulo = titulo
		self._autor = autor
		self._genero = genero
		self._sinopse = sinopse
		self._imagemCapa = imagemCapa
	}

	static func == (lhs: Livro, rhs: Livro) -> Bool {
		return lhs.id == rhs.id
	}

	var id: UUID {
		get { return _id }
	}
	
	var titulo: String {
		get { return _titulo }
		set { _titulo = newValue }
	}
	
	var autor: String {
		get { return _autor }
		set { _autor = newValue }
	}

	var genero: String {
		get { return _genero }
		set { _genero = newValue }
	}

	var sinopse: String {
		get { return _sinopse }
		set { _sinopse = newValue }
	}

	var imagemCapa: String {
		get { return _imagemCapa }
		set { _imagemCapa = newValue }
	}
>>>>>>> 177dd1f76ea0a478f324b84d4ad6b4d08b12b82c
}
