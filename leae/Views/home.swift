import SwiftUI
//import Charts

struct Gadget: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let icon: String
    let color: Color
}
    
struct GadgetCard: View {
    let gadget: Gadget
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            HStack {
                Image(systemName: gadget.icon)
                    .font(.title)
                    .foregroundColor(Color("Highlight"))
                Spacer()
            }
            
            Text(gadget.title)
                .font(.headline)
                .foregroundColor(Color("Highlight"))
            
            Text(gadget.description)
                .font(.subheadline)
                .foregroundColor(Color("Hover").opacity(0.8))
                .lineLimit(2)
        }
        .padding()
        .frame(width: 215, height: 160)
        .background(gadget.color)
        .cornerRadius(20)
        .shadow(color: .black.opacity(0.2), radius: 10, x: 0, y: 5)
    }
}

struct GadgetCarousel: View {
    let gadgets: [Gadget]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(gadgets) { gadget in
                    GadgetCard(gadget: gadget)
                }
            }
            .padding()
        }
    }
}

// explorar
// troca e doacao

// estrutura para tabbar

struct TabBar: View {
    var body: some View{
        
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                        .font(.system(size:25))
                    Text("Home")
                }
            
//            NavigationView{ LivroView() }
            Color.purple
                .tabItem{
                    Image(systemName: "globe")
                        .font(.system(size:25))
                    Text("Explorar")
                }
            
            LibraryView()
                .tabItem{
                    Image(systemName: "book")
                        .font(.system(size:25))
                    Text("Bilioteca")
                }
            
            Color.clear
                .tabItem{
                    Image(systemName: "person.circle")
                        .font(.system(size:25))
                    Text("Perfil")
                }

        }
        .accentColor(Color("Highlight"))
        .foregroundColor(.black)
    }
}


struct HomeView: View {
    let sampleGadgets = [
        Gadget(title: "Leitura", description: "Acompanhe sua leitura e progresso atual", icon: "books.vertical.fill", color: Color(hex: "FFD9CF")),
        Gadget(title: "Constância", description: "Acompanhe agora seu empenho diário!", icon: "flame.fill", color: Color(hex: "FFD9CF"))
    ]
    
    var body: some View {
        VStack{
            ScrollView{
                HStack {
                    Text("Resumo")
                        .font(.title)
                        .fontWeight(.semibold)
                    Spacer()
                }
//                Spacer()
                .padding()
                .padding(.horizontal)
                
                Spacer(minLength: -4)
                
                
                // Carrossel corrigido
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 20) {
                        ForEach(sampleGadgets) { gadget in
                            GadgetCard(gadget: gadget)
                        }
                    }
                    .padding(.horizontal)  // Adiciona padding nas laterais
                    .frame(height: 200)    // Altura fixa para o conteúdo
                }
                .frame(height: 220)        // Altura fixa para o ScrollView
                ListCard(title:"Grupos", sub: "Leia e discuta com seus amigos", GroupBook: ["Faz o urro":"Shreck", "Fãs do Damon":"TVD", "Self Assestment":"Mente milionaria"])
                
                
                VStack{
                    
//                    Spacer(minLength: -)
                    
                    TitleStructure(title: "Comentários", sub: "Veja todos")
                    
                    FakeListStructure(book: ["O Shreck não faz o urro", "Gato de botas é zika do baile", "Lord farcry é poggers"])
                }
                
//            VStack{
//                InfoCard(Up:"Teste", Down: "Teste")
//
//                ListCard(title: "Titulo Seção", book: ["L1","L2","L3"])
//                Spacer()
//                }
                    
            }
            

//            TabBar()
            
        }
    }
}
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}



// shift + command + k - resetar, rebuild e limpeza de cache
// botao direito + extract = cria struct com funcao selecionada
