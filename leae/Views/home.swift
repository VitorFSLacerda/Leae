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
                    .foregroundColor(.white)
                Spacer()
            }
            
            Text(gadget.title)
                .font(.headline)
                .foregroundColor(.white)
            
            Text(gadget.description)
                .font(.subheadline)
                .foregroundColor(.white.opacity(0.8))
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
                    Image(systemName: "heart.fill")
                        .font(.system(size:25))
                    Text("Doação")
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

struct AltZstack: View{
    var body: some View{
        ZStack{
            VStack{
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.orange)
                    .frame(width: 343, height: 140)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 0)

            }
        }
    }
}


struct SimpleBarChart: View{
    let data: [BarData]
    
    var body: some View {
        VStack {
//            // Título (opcional)
//            Text("Páginas lidas")
//                .font(.headline)
//                .padding(.trailing, 220)
            
            // Gráfico
            HStack(alignment: .bottom, spacing: 8) {
                ForEach(data) { bar in
                    VStack {
                        // Barra
                        Rectangle()
                            .fill(bar.color)
                            .frame(height: calculateBarHeight(value: bar.value))
                        
                        // Rótulo do valor
                        Text("\(Int(bar.value))")
                            .font(.caption)
                        
                        // Rótulo da categoria
                        Text(bar.label)
                            .font(.caption2)
                            .frame(width: 60)
                            .lineLimit(1)
                    }
                }
            }
            .frame(height: 200)
            .padding(.horizontal)
        }
    }
    
    private func calculateBarHeight(value: Double) -> CGFloat {
        let maxValue = data.map { $0.value }.max() ?? 1
        return CGFloat(value / maxValue) * 140 // 180 é a altura máxima das barras
    }
}

struct BarData: Identifiable {
    let id = UUID()
    let label: String
    let value: Double
    let color: Color
}

let sampleData = [
            BarData(label: "Seg", value: 50, color: .blue),
            BarData(label: "Ter", value: 80, color: .green),
            BarData(label: "Qua", value: 30, color: .red),
            BarData(label: "Qui", value: 60, color: .orange),
            BarData(label: "Sex", value: 90, color: .purple)
        ]

struct HomeView: View {
    let sampleGadgets = [
        Gadget(title: "Leitura", description: "Acompanhe sua leitura e progresso atual", icon: "books.vertical.fill", color: .blue),
        Gadget(title: "Seu progresso", description: "Acompanhe agora sua posição no ranking", icon: "brain.head.profile", color: .green),
        Gadget(title: "Doe cultura", description: "Participe do programa de doação de livros!", icon: "heart.fill", color: .orange)
    ]
    
    var body: some View {
        VStack{
            ScrollView{
                HStack {
                    Text("Resumo")
                        .font(.system(size: 30, weight: .semibold))
                    Spacer()
                }
//                Spacer()
                .padding()
                .padding(.horizontal)
                
                Spacer(minLength: -5)
                
                
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
                VStack {
                    HStack {
                        Text("Grupos")
                            .font(.system(size: 25, weight: .semibold))
                        Spacer()
                        Text("Veja todos")
                            .font(.system(size: 12, weight: .light))
                            .foregroundColor(.blue)
                            .padding()
                    }
                }
                .padding()
                .padding(.horizontal)
                
                FakeListStructure(book: ["Shreck", "TVD", "Faz o urro"])
                
                TitleStructure(title: "Seu Ranking", sub:"Ver mais")
                
                Spacer(minLength: -40)

                SimpleBarChart(data: sampleData)
                    .frame(height: 300)
                    .padding()
                
                TitleStructure(title: "Comentários", sub: "Veja todos")

                FakeListStructure(book: ["O Shreck não faz o urro", "Gato de botas é zika do baile", "Lord farcry é poggers"])

                    
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


