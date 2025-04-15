import SwiftUI

struct Missoes: View {
    let dias = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sab", "Dom"]
    var body: some View {
        VStack{
            Image("book")
                .resizable()
                .frame(width: 200, height: 200)
            Text("129")
            Text("dias de ofensiva!")
            HStack {
                ForEach(dias, id: \.self) { dia in
                    VStack {
                        Text(dia)
                            .font(.headline)
                        Image("check")
                            .resizable()
                            .frame(width: 30, height: 30)
                    }
                    .padding(.horizontal, 4)
                }
            }
            
            VStack{
                Text("Missões diárias")
                    
            }
                
        }.navigationTitle("Missões")
                    
    }
}

struct Missoes_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Missoes()
        }
    }
}
