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
                    .foregroundColor(Color(hex: "6F230F"))
                Spacer()
            }
            
            Text(gadget.title)
                .font(.headline)
                .foregroundColor(Color(hex: "6F230F"))
            
            Text(gadget.description)
                .font(.subheadline)
                .foregroundColor(Color(hex: "FF642F").opacity(0.8))
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
    @State var selectedTab = 0
    let isViewActive = false
    var body: some View{
        
        TabView{
            HomeView()
                .tabItem{
                    Image(systemName: "house")
                        .font(.system(size:25))
                    Text("Home")
                }
                .tag(0)
            
            Color.red
                .tabItem{
                    Image(systemName: "globe")
                        .font(.system(size:25))
                    Text("Explorar")
                }
                .tag(1)
            
            Color.clear
                .tabItem{
                    Image(systemName: "book")
                        .font(.system(size:25))
                    Text("Bilioteca")
                }
                .tag(2)
            
            Color.clear
                .tabItem{
                    Image(systemName: "person.circle")
                        .font(.system(size:25))
                    Text("Perfil")
                }
                .tag(3)
        }
        .foregroundColor(.black)
    }
}


struct HomeView: View {
    @State private var modalVisible = false
    @State private var showGroupModal = false
    
    let sampleGadgets = [
        Gadget(title: "Leitura", description: "Acompanhe sua leitura e progresso atual", icon: "books.vertical.fill", color: Color(hex: "FFD9CF")),
        Gadget(title: "Constância", description: "Acompanhe agora seu empenho diário!", icon: "flame.fill", color: Color(hex: "FFD9CF"))
    ]
    var body: some View{
        NavigationView{
            VStack{
                ScrollView{
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
                    
                    //                NavigationView{
                    ZStack{
                        ListCard(title:"Grupos",
                                 sub: "Leia e discuta com seus amigos",
                                 GroupBook: ["Faz o urro":"Shreck",
                                             "Fãs do Damon":"TVD",
                                             "Self Assestment":"Mente milionaria"])
                            .onTapGesture{
                                showGroupModal = true
                            }
                    }
                    .background(
                        NavigationLink(
                            isActive: $showGroupModal,
                            destination: {
//                                GroupModal()
                            },
                            label: { EmptyView() }
                        )
                            .hidden()
                            .frame(width: 0, height: 0)
                    )
                    //                }
                    VStack{
                        
                        //                    Spacer(minLength: -)
                        
                        TitleStructure(title: "Comentários")
                        
                        Spacer(minLength: -15)
                        //                    FakeListStructure(book: ["O Shreck não faz o urro", "Gato de botas é zika do baile", "Lord farcry é poggers"])
                        
                        Comments(UserandComment:["@Felipe__alberto":"Não acredito que fulano fez ISSO. Tô revoltado e ainda faltam 200 páginas 😭","@Ferrari":"Li por indicação daqui e amei! Que comunidade maravilhosa!","@Vitao":"Esse final acabou comigo 🥲 Alguém mais aí precisando de terapia depois dessa leitura?","@ErikaHacimoto":"Li por indicação daqui e amei! Que comunidade maravilhosa!","@Rugs":"SHRECK FEZ O URROOOOOOOOO"])
                    }
                    
                }
                .navigationBarTitle("Resumo")

            }
        }
        
//        .navigationViewStyle(.stack)
//        .ignoresSafeArea(.all, edges: .top)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}



// shift + command + k - resetar, rebuild e limpeza de cache
// botao direito + extract = cria struct com funcao selecionada

