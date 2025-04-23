
import SwiftUI

struct ViewLivro: View {
    var nomeLivro = "Ainda estou aqui"
    var nomeEscritor = "Marcelo Rubens Paiva"
    var nomeAutor = "Mauricio"
    var body: some View {
        ZStack {
            Color("fundo").ignoresSafeArea()
            
            ScrollView{
                VStack{
                    
                    Rectangle()
                            .fill(Color.black)
                            .frame(width: 150, height: 250)
                            .cornerRadius(10)
                                
                    Text(nomeLivro).bold()
                    Text(nomeEscritor)
                    
                    Text("Sinopse")
                        .bold()
                        .frame(maxWidth: 285, alignment: .leading)
                    
                    ZStack{
                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                                .fill(Color("laranja"))
                                .frame(width: 300, height: 180)

                        RoundedRectangle(cornerRadius: 25, style: .continuous)
                            .fill(Color("fundo"))
                            .frame(width: 295, height: 175)
                        
                        Text("Texto aqui texto aqui texto aqui texto aquiaaaaaaaaaaaaaaaaaaaaaaaaaaaa")
                            .frame(width: 260, height: 140, alignment: .topLeading)
                            .multilineTextAlignment(.leading)
                            .lineLimit(6)
                    }
                    
                    HStack(spacing: 100){
                        Text("Resenhas")
                            .bold()
                            .frame(maxWidth: 285, alignment: .leading)
                        
                        Text("Ver mais...")
                            .foregroundColor(Color("laranja"))
                            .frame(maxWidth: 285, alignment: .leading)
                    }
                    .frame(maxWidth: 285, alignment: .leading)
                    
                    ZStack {
                        RoundedRectangle(cornerRadius: 25)
                            .fill(Color("bloco"))
                            .frame(width: 300, height: 180)

                        VStack(alignment: .leading, spacing: 8) {
                            HStack(spacing: 10) {
                                Circle()
                                    .fill(Color("laranja"))
                                    .frame(width: 40, height: 40)

                                Text(nomeAutor)
                                    .font(.headline)
                                    .lineLimit(1)
                            }

                            Text("Texto aqui texto aqui texto aqui texto aqui")
                                .multilineTextAlignment(.leading)
                                .lineLimit(6)
                            
                            
                            
                            HStack(spacing: 30) {
                                
                                    Image(systemName: "heart")
                                    Image(systemName: "ellipsis.bubble")
                            }
                            .offset(y: 35)
                            
                            
                        }
                        .offset(y: -20)
                        .frame(width: 260, alignment: .leading)
                    
                }
                        
        
                    Text("Avaliações")
                        .bold()
                        .frame(maxWidth: 285, alignment: .leading)
                    
                    ZStack{
                        Rectangle()
                                .fill(Color("bloco"))
                                .frame(width: 300, height: 180)
                                .cornerRadius(25)
                        
                        
                        Text("Texto aqui texto aqui texto aqui texto aqui")
                    }
                    
                }
            }.navigationTitle("Livro")
        }
    }
}

struct Livro_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ViewLivro()
        }
    }
}
