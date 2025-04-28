//
//  testeApp.swift
//  teste
//
//  Created by Aluno 11 on 11/03/25.
//

import SwiftUI


extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue: Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}



struct TitleStructure: View {
    let title: String  // No default value, must be provided when creating the view
    let sub: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.title)
                    .fontWeight(.medium)
                Spacer()
                Text(sub)
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.blue)
                    .padding()
            }
        }
        .padding()
        .padding(.horizontal)
    }
}


// chamada: TitleStructure(title: "tituloAqui", sub: "SeuSubAqui")

struct FakeListStructure: View{
    let book: [String]
    
    var body: some View{
        //optional
        //AltZstack()
        ForEach(book, id: \.self){ books in
            VStack(spacing: 2){
                HStack{
                    Text(books)
                        .font(.system(size:16, weight: .light))
                        .padding(.horizontal,4)
                        .padding(.top, -25)
                    Spacer()
                }
                Divider()
            }
            .padding()
            .padding(.horizontal)
        }
    }
}

// chamada: FakeListStructure(books:["livro1","livro2","livro3])

struct InfoCard: View{
    let Up : String
    let Down : String
    
    var body: some View{
        ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.orange)
                    .frame(width: 343, height: 140)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 0)
            VStack(spacing: 12){
                Text(Up)
                    .font(.title2)
                    .fontWeight(.medium)
                    .foregroundColor(.white)
                
                Text(Down)
                    .font(.body)
                    .fontWeight(.regular)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(2)
                
            }
            .padding()
        }
        .padding()
    }
}

// chamada: InfoCard(Up: "Titulo", Down: "Descrição")

struct ListCard: View {
    let title: String
    let sub: String
    let GroupBook: [String: String]
    
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            // Background card (only one cornerRadius modifier needed)
            RoundedRectangle(cornerRadius: 20)
                .foregroundColor(Color(hex: "FFD9CF"))
                .frame(width: 365, height: 285)
                .shadow(color: .black.opacity(0.2), radius: 5, x: 3, y: 0)
            
            // Content
            VStack(alignment: .leading, spacing: 10) {
                // Title
                Text(title)
                    .font(.title)
                    .fontWeight(.medium)
                    .padding(.top, 16)
                    .padding(.horizontal, 20)
                
                Text(sub)
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.top, -5)
                    .padding(.horizontal, 23)
            
                
                Spacer()
                
                // List items
                VStack(alignment: .leading, spacing: 8) {
                    ForEach(Array(GroupBook.keys.sorted()), id: \.self) { group in
                        if let book = GroupBook[group] {
                            VStack(alignment: .leading, spacing: 4) {
                                Text(group)
                                    .font(.system(size: 16, weight: .light))
                                HStack{
                                    Text(book)
                                        .font(.caption)
                                        .fontWeight(.light)
                                    //                                HStack{
                                    Spacer()
                                    Image(systemName:"chevron.right")
                                        .foregroundColor(Color(hex: "6F230F"))
                                }
                            }
                            Divider()
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 16)
            }
            .frame(width: 343, height: 140, alignment: .topLeading)
        }
    }
}
// chamada: ListCard(title: "Titulo Seção", sub: "subtitle", GroupBook: ["GroupName":"Book","GN2":"B2","GN3:B3"])

//
//@main
//struct testeApp: App {
//    var body: some Scene {
//        WindowGroup {
//                HomeView()
//            }
//        }
//    }





// ESTRUTURA DE GRAFICO DE BARRAS PARA CONSTANCIA
//
//
//

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

//TitleStructure(title: "Constância", sub:"Ver detalhes")

//Spacer(minLength: -40)

//SimpleBarChart(data: sampleData)
//    .frame(height: 300)
//    .padding()

//
//
//
//ESTRUTURA DE GRAFICO DE BARRAS PARA CONSTANCIA

