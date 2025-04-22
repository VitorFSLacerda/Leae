import SwiftUI

struct PerfilProprio: View {
    @State var imagemPerfil = "perfilImagem"
    @State var name = "Maria Gabriella Almeida"
    @State var arroba = "@"+"marimeida"
    @State var blocos = ["perfilImagem", "perfilImagem", "perfilImagem"]
    var icons = ["book", "square.grid.2x2", "star", "flame"]
    var titulos = ["Biblioteca", "Grupos", "Missões", "Conquistas"]
    let colunas = [GridItem(.flexible()), GridItem(.flexible())]
    let curtida = "3"
    let comentario = "4"
    let salvo = "2"

    
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
                            Text(name)
                                .font(.system(size:25))
                            
                            Text(arroba)
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
                        ForEach(blocos, id: \.self) { bloco in
                            ZStack{
                                Rectangle()
                                    .fill(Color("bloco"))
                                    .frame(width: 370, height: 200)
                                    .cornerRadius(10)
                                    
                                Text(arroba)
                                    .padding(.bottom, 160)
                                    .padding(.trailing, 250)
                                
                                Text("Esse é um comentario sobre o livro.")
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
                                    HStack{
                                        Image(systemName: "heart")
                                        Text(curtida)
                                    }
                                    HStack{
                                        Image(systemName: "ellipsis.bubble")
                                        Text(comentario)
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

struct PerfilProprio_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            PerfilProprio()
        }
    }
}
