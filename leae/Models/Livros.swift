import Foundation


class Livros {
    
    var titulo: String
    var autor: String
    var genero: String
    var sinopse: String
    var imagemCapa: String
    var porcentagemLido: Int

    init(titulo: String, autor: String, genero: String, sinopse: String, imagemCapa: String) {
        self.titulo = titulo
        self.autor = autor
        self.genero = genero
        self.sinopse = sinopse
        self.imagemCapa = imagemCapa
        self.porcentagemLido = 0
    }
}
