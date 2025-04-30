import SwiftUI

struct ViewPerfilProprio: View {

    
    //  @EnvironmentObject var viewModelUsuario: ViewModelUsuario
    //  @StateObject private var comentarioViewModel = ViewModelComentario()
    //
    //
    let progresso: CGFloat = 0.61 // 61%
    
    var icons = ["book", "square.grid.2x2", "star", "flame"]
    var titulos = ["Biblioteca", "Grupos"]
    let colunas = [GridItem(.flexible()), GridItem(.flexible())]
    //  var qtdComentarios: Int {
    //    comentarioViewModel.quantidadeDeComentarios()
    //  }
    
    // Substituindo os ViewModels por dados simulados
    @State private var diasConstancia: Int = 10
    @State private var foto = "perfilImagem"
    @State private var nome = "Joana Silva"
    @State private var apelido = "@joanasilva"
    @State private var fala = "Sou muito maneiro!"
    
    
    @State private var comentarios = [
        // Passando o livro obrigatório
        Comentario(livro: Livro(titulo: "O Pequeno Príncipe", autor: "Antoine de Saint-Exupéry", genero: "Fábula", sinopse: "Um jovem príncipe que viaja por planetas.", imagemCapa: "pequeno_principe.jpg"), usuario: Usuario(foto: "", apelido: "@VitorLacerda", nome: "Vitor Lacerda", email: "", senha: "", livroAtual: Livro(titulo: "O Pequeno Príncipe", autor: "Antoine de Saint-Exupéry", genero: "Fábula", sinopse: "Um jovem príncipe que viaja por planetas.", imagemCapa: "pequeno_principe.jpg"), gruposUsuario: [], missoes: [], comentarios: []), texto: "Ótima interface!", curtidas: 10, comentarios: []),
        Comentario(livro: Livro(titulo: "O Pequeno Príncipe", autor: "Antoine de Saint-Exupéry", genero: "Fábula", sinopse: "Um jovem príncipe que viaja por planetas.", imagemCapa: "pequeno_principe.jpg"), usuario: Usuario(foto: "", apelido: "", nome: "", email: "", senha: "", livroAtual: Livro(titulo: "O Pequeno Príncipe", autor: "Antoine de Saint-Exupéry", genero: "Fábula", sinopse: "Um jovem príncipe que viaja por planetas.", imagemCapa: "pequeno_principe.jpg"), gruposUsuario: [], missoes: [], comentarios: []), texto: "O layout poderia ser mais clean", curtidas: 3, comentarios: [])
    ]
    
    var body: some View {
        ZStack {
            Color.backgroundBase
                .ignoresSafeArea()
            ScrollView{
                
                
                VStack(spacing: 20){
                    Spacer()
                    Image(foto)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 230, height: 230)
                        .clipShape(Circle())
                    HStack(alignment: .top){
                        
                        VStack(alignment: .leading){
                            Text("Aline Almeida")
                                .foregroundColor(Color.textPrimary)
                                .font(.system(size:25))
                            Text(apelido)
                                .foregroundColor(Color.primaryHover)
                            
                            Text(fala)
                                .foregroundColor(Color.textPrimary)
                                .padding(.top, 5)
                        }
                        
                        Spacer()
                        ZStack{
                            Rectangle()
                                .fill(Color.secundaryDefault)
                                .frame(width: 70, height: 40)
                                .cornerRadius(20)
                            HStack{
                                Image(systemName: "flame")
                                    .foregroundColor(Color.accentHighlight)
                                    .font(.system(size: 20))
                                Text(String(diasConstancia))
                                    .foregroundColor(Color.textPrimary)
                            }
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    
                    
                    LazyVGrid(columns: colunas, spacing: 10) {
                        ForEach(0..<2) { i in
                            ZStack{
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color.secundaryBackground)
                                    .frame(height: 110)
                                Rectangle()
                                    .fill(Color.secundaryDefault)
                                //.opacity(0.5)
                                    .frame(width: 30, height: 30)
                                    .cornerRadius(10)
                                    .padding(.top, 60)
                                    .padding(.trailing, 100)
                                
                                Image(systemName: icons[i])
                                    .foregroundColor(Color.accentHighlight)
                                    .padding(.trailing, 100)
                                    .padding(.top, 60)
                                
                                Text(titulos[i])
                                    .foregroundColor(Color.accentHighlight)
                                    .padding(.leading, 20)
                                    .padding(.top, 60)
                                
                            }
                            
                        }
                    }
                    .padding(.horizontal)
                    
                    
                    VStack{
                        Text("Meus comentários")
                            .font(.system(size: 25))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.horizontal)
                        
                        
                        ForEach(0..<2, id: \.self) { index in
                            let comentario = comentarios[index]
                            
                            ZStack {
                                
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.primaryHover, lineWidth: 4)
                                    .background(Color.backgroundBase.opacity(0.1))
                                    .cornerRadius(10)
                                    .frame(width: 370, height: 200)
                                
                                Text(apelido)
                                    .foregroundColor(Color.textPrimary)
                                    .padding(.bottom, 170)
                                    .padding(.trailing, 260)
                                
                                Text(comentario.texto)
                                    .padding(.bottom, 75)
                                    .padding(.leading, 130)
                                    .multilineTextAlignment(.leading)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                
                                Rectangle()
                                    .frame(width: 100, height: 160)
                                    .cornerRadius(10)
                                    .padding(.trailing, 250)
                                    .padding(.top, 25)
                                
                                Image(systemName: "square.and.pencil")
                                    .foregroundColor(Color.accentHighlight)
                                    .font(.system(size: 20))
                                    .padding(.bottom, 150)
                                    .padding(.leading, 300)
                                
                                HStack(spacing: 10) {
                                    HStack {
                                        Image(systemName: "heart")
                                        Text(String(comentario.curtidas))
                                    }
                                    .foregroundColor(Color.accentHighlight)
                                    
                                    HStack {
                                        Image(systemName: "ellipsis.bubble")
                                        Text(String(comentario.comentarios.count))
                                    }
                                    .foregroundColor(Color.accentHighlight)
                                    
                                    ZStack(alignment: .leading) {
                                        Capsule()
                                            .frame(width: 100, height: 10)
                                            .foregroundColor(Color.borderDefault) // cor de fundo da barra
                                        
                                        Capsule()
                                            .frame(width: 100 * progresso, height: 10)
                                            .foregroundColor(Color.accentHighlight) // marrom escuro
                                    }
                                    Text("\(Int(progresso * 100))%")
                                        .font(.subheadline)
                                        .foregroundColor(Color.accentHighlight)
                                    
                                }
                                .padding(.top, 150)
                                .padding(.leading, 110)
                            }
                        }
                        
                    }
                }
                
            }
            .navigationTitle("Meu Perfil")
            
            

        }
        
    }
}

struct PerfilProprio_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ViewPerfilProprio()
            
        }
    }
}
