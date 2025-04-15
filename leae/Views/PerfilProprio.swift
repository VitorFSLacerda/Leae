import SwiftUI

struct PerfilProprio: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 20){
                Circle()
                    .frame(width: 300, height: 300)
                HStack{
                    VStack{
                        Text("Vitor")
                        Text("@xxxxx")
                    
                    }
                    Spacer()
                    Image(systemName: "gear")
                        .font(.system(size:25))
                }
                .padding(.horizontal)
                
                VStack{
                    HStack{
                        Rectangle()
                            .frame(width: 180, height: 130)
                        Rectangle()
                            .frame(width: 180, height: 130)
                    }
                    HStack{
                        Rectangle()
                            .frame(width: 180, height: 130)
                        Rectangle()
                            .frame(width: 180, height: 130)
                    }
                }
                
                VStack{
                    Text("Meus comentários")
                    Rectangle()
                        .frame(width: 350, height: 200)
                    Rectangle()
                        .frame(width: 350, height: 200)
                    Rectangle()
                        .frame(width: 350, height: 200)
                    Rectangle()
                        .frame(width: 350, height: 200)
    
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
