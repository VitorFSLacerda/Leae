import SwiftUI

struct ViewPerfilProprio: View {
    
    @ObservedObject var viewModelUsuario: UsuarioViewModel
    @ObservedObject var comentarioViewModel: ViewModelComentario
    @State private var imagemPerfil: String
    @State private var nome: String
    @State private var apelido: String
    
    
    
    init(viewModel: UsuarioViewModel, comentarios: [Comentario]) {
        self.viewModelUsuario = viewModel
        self.comentarioViewModel = ViewModelComentario(comentarios: comentarios)
                _imagemPerfil = State(initialValue: viewModel.foto)
        _nome = State(initialValue: viewModel.nome)
        _apelido = State(initialValue: viewModel.apelido)
    }

    var icons = ["book", "square.grid.2x2", "star", "flame"]
    var titulos = ["Biblioteca", "Grupos", "Missões", "Conquistas"]
    let colunas = [GridItem(.flexible()), GridItem(.flexible())]
    var qtdComentarios: Int {
        comentarioViewModel.quantidadeDeComentarios()
    }
    


    var body: some View {
        ZStack {
            Color("fundo")
                .ignoresSafeArea()
            ScrollView{
            
                            
                VStack(spacing: 20){
                    Image(imagemPerfil)
                        .resizable()
                        .scaledToFill() // Garante que a imagem preencha o círculo
                        .frame(width: 230, height: 230) // Tamanho do círculo
                        .clipShape(Circle()) // Recorta a imagem no formato de círculo
                    HStack{
                        VStack(alignment: .leading){
                            Text(nome)
                                .font(.system(size:25))
                            
                            Text(apelido)
                        }
                        
                        Spacer()
                        ZStack{
                            Circle()
                                .fill(Color("bloco"))
                                .opacity(0.7)
                                .frame(width: 33, height: 33)
                                .cornerRadius(10)
                            
                            Image(systemName: "gear")
                                .font(.system(size:25))
                        }
                        
                    }
                    .padding(.horizontal)
                    
                    

                    LazyVGrid(columns: colunas, spacing: 10) {
                        ForEach(0..<4) { i in
                            ZStack{
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(Color("bloco"))
                                    .frame(height: 110)
                                Rectangle()
                                                .fill(Color.black)
                                                .opacity(0.1)
                                                .frame(width: 30, height: 30)
                                                .cornerRadius(10)
                                                .padding(.top, 60)
                                                .padding(.trailing, 100)
                                                
                                Image(systemName: icons[i])
                                    .padding(.trailing, 100)
                                    .padding(.top, 60)
                                Text(titulos[i])
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
                        

                        ForEach(0..<qtdComentarios, id: \.self) { index in
                            let comentario = comentarioViewModel.comentarios[index]

                            ZStack {
                                Rectangle()
                                    .fill(Color("bloco"))
                                    .frame(width: 370, height: 200)
                                    .cornerRadius(10)
                                
                                Text(comentario.usuario.apelido)
                                    .padding(.bottom, 160)
                                    .padding(.trailing, 250)
                                
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
                                    .font(.system(size: 20))
                                    .padding(.bottom, 150)
                                    .padding(.leading, 300)
                                
                                HStack(spacing: 150) {
                                    HStack {
                                        Image(systemName: "heart")
                                        Text(String(comentario.curtidas))
                                    }
                                    HStack {
                                        Image(systemName: "ellipsis.bubble")
                                        Text(String(comentario.comentarios.count))
                                    }
                                }
                                .padding(.top, 150)
                                .padding(.leading, 100)
                            }
                        }

                    }
                }
                    
            }.navigationTitle("Perfil")
        }
            
    }
}

//struct PerfilProprio_Previews: PreviewProvider {
//    static var previews: some View {
//        NavigationView{
//            ViewPerfilProprio(viewModel: <#UsuarioViewModel#>, comentarios: <#[Comentario]#>)
//        }
//    }
//}
    

