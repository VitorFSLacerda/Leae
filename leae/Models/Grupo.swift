import Foundation

class Grupo {
    
    var livroGrupo: Livros
    var usuariosGrupo: [Usuario]
    var missao: Missao
    
    init(livroGrupo: Livros, usuariosGrupo: [Usuario], missao: Missao) {
            self.livroGrupo = livroGrupo
            self.usuariosGrupo = usuariosGrupo
            self.missao = missao
    }
}
