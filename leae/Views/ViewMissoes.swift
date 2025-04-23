import SwiftUI

struct Missoes: View {
    let dias = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sab", "Dom"]
    let missoes = ["Nova leitura 50 XP", "Comente algo 30 XP", "Leia 15 páginas 60 XP"]

    var body: some View {
        ScrollView{
            VStack{
                Image("book_")
                    .resizable()
                    .frame(width: 150, height: 150)
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
                .padding(4)
                .background(RoundedRectangle(cornerRadius: 25)
                                .stroke(Color.black, lineWidth: 1))
                
                
                VStack(){
                    Text("Missões diárias")
                    
                    VStack(alignment: .leading){
                        ForEach(missoes, id: \.self) { missao in
                            HStack{
                                Image("check")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text(missao)
                                    .font(.headline)

                            }
                            
                        }
                    }.padding([.leading, .trailing], 45)

                        
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 1))
                
                VStack(){
                    Text("Missões anuais")
                    
                    VStack(alignment: .leading){
                        ForEach(missoes, id: \.self) { missao in
                            HStack{
                                Image("check")
                                    .resizable()
                                    .frame(width: 30, height: 30)
                                Text(missao)
                                    .font(.headline)

                            }
                            
                        }
                    }.padding([.leading, .trailing], 45)

                        
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 1))
                
                VStack(){
                    Text("Criar missão")
                    
                    VStack(alignment: .leading){
                        
                        HStack{
                            Image(systemName: "book")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("___________")
                                .font(.headline)
                            Image(systemName: "bolt")
                                .resizable()
                                .frame(width: 30, height: 30)
                            Text("_____")
                                .font(.headline)
                            Text("XP")
                                .font(.headline)
                        }
                        HStack{
                            Text("Diário")
                            Text("Anual")
                        }.padding(.leading, 85)
                        
                        
                            
                        
                    }.padding([.leading, .trailing], 20)

                        
                }
                .padding()
                .background(RoundedRectangle(cornerRadius: 25)
                                    .stroke(Color.black, lineWidth: 1))
                    
            }.navigationTitle("Missões")
        }
    }
}

struct Missoes_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Missoes()
        }
    }
}
