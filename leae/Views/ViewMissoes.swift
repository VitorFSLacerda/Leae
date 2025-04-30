import SwiftUI

struct ViewMissoes: View {
    @State private var showSheet = false
    
    var body: some View {
        Button("Progresso") {
            showSheet = true
        }
        .background( ConstanciaPresenter(isPresented: $showSheet) {CustomConstanciaView()} )
    }
}

struct Missoes_Previews: PreviewProvider {
    static var previews: some View {
        ViewMissoes()
    }
}

struct ConstanciaPresenter<Content: View>: UIViewControllerRepresentable {
    @Binding var isPresented: Bool
    var content: () -> Content
    
    func makeUIViewController(context: Context) -> UIViewController {
        UIViewController()
    }
    
    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {
        guard isPresented, uiViewController.presentedViewController == nil else { return }
        
        let hostingController = UIHostingController(rootView: content())
        hostingController.modalPresentationStyle = .pageSheet
        
        if let sheet = hostingController.sheetPresentationController {
            sheet.detents = [.large()]
            sheet.prefersGrabberVisible = true
            sheet.preferredCornerRadius = 30
        }
        
        uiViewController.present(hostingController, animated: true) {
            isPresented = false // reseta para evitar múltiplas apresentações
        }
    }
}

struct CustomConstanciaView: View {
    let dias = ["Dom", "Seg", "Ter", "Qua", "Qui", "Sex", "Sab"]
    @State private var resultado_rdc: String = "01"
    @State private var resultado_rsc: String = "02"
    @State private var resultado_dc: String = "038"
    @State private var resultado_sc: String = "04"
    
    var body: some View {
        VStack{
            HStack(alignment: .center, spacing: 0) {
                Image(systemName: "chevron.backward")
                    .foregroundColor(Color("Hover"))
                    .offset(y: 15)
                Text("Cancelar")
                    .font(
                        Font.custom("SF Pro Text", size: 15)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Hover"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .offset(y: 15)
                Text("Constância")
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Highlight"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .offset(x: -90, y: 15)
            }
            .frame(width: .infinity, height: 30, alignment: .center)
            .padding(5)
            VStack{
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 344, height: 140)
                        .background(Color("Background"))
                        .cornerRadius(10)
                        .padding()
                    Text("Esta Semana")
                        .font(
                            Font.custom("SF Pro Text", size: 20)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Highlight"))
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .offset(x: 30, y: -40)
                }
                ZStack {
                    
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 344, height: 300)
                        .background(Color("Background"))
                        .cornerRadius(10)
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width:  148, height: 150)
                            .background(Color("SecundaryDefault"))
                            .cornerRadius(10)
                            .offset(x: -83, y: 50)
                        Text("Semanas Consecutivas")
                            .font(
                                Font.custom("SF Pro Text", size: 16)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: 148, alignment: .center)
                            .offset(x: -85, y: 10)
                        Text("\(resultado_sc)")
                            .font(
                                Font.custom("SF Pro Text", size: 64)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: 130, alignment: .leading)
                            .offset(x: -60, y: 75)
                    }
                    ZStack{
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width:  148, height: 150)
                            .background(Color("SecundaryDefault"))
                            .cornerRadius(10)
                            .offset(x: 83, y: 50)
                        Text("Dias Consecutivos")
                            .font(
                                Font.custom("SF Pro Text", size: 16)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.center)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: 130, alignment: .center)
                            .offset(x: 85, y: 10)
                        Text("\(resultado_dc)")
                            .font(
                                Font.custom("SF Pro Text", size: 64)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: 130, alignment: .center)
                            .offset(x: 85, y: 75)
                    }
                    Text("Ofensivas Atuais")
                        .font(
                            Font.custom("SF Pro Text", size: 32)
                                .weight(.semibold)
                        )
                        .multilineTextAlignment(.leading)
                        .foregroundColor(Color("Highlight"))
                        .frame(maxWidth: .infinity, alignment: .center)
                        .offset(y: -65)
                }
            }
            Spacer().frame(height: 20)
            ScrollView(.horizontal){
                HStack{
                    Spacer().frame(width: 10)
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 324, height: 185)
                            .background(Color("Background"))
                            .cornerRadius(10)
                            .padding(5)
                        Text("Recorde de Semanas")
                            .font(
                                Font.custom("SF Pro Text", size: 28)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: -60)
                        Text("Consecutivas")
                            .font(
                                Font.custom("SF Pro Text", size: 28)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: -30)
                        Text("\(resultado_rsc)")
                            .font(
                                Font.custom("SF Pro Text", size: 64)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: 15)
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 324, height: 45)
                                .background(Color("SecundaryDefault"))
                                .cornerRadius(10)
                                .padding(5)
                                .offset(y:70)
                            Text("6 de julho - 4 de setembro")
                                .font(
                                    Font.custom("SF Pro Text", size: 20)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("Highlight"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .offset(x: 25, y: 68)
                        }
                    }
                    ZStack {
                        Rectangle()
                            .foregroundColor(.clear)
                            .frame(width: 324, height: 185)
                            .background(Color("Background"))
                            .cornerRadius(10)
                        Text("Recorde de Dias")
                            .font(
                                Font.custom("SF Pro Text", size: 28)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: -60)
                        Text("Consecutivos")
                            .font(
                                Font.custom("SF Pro Text", size: 28)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: -30)
                        Text("\(resultado_rdc)")
                            .font(
                                Font.custom("SF Pro Text", size: 64)
                                    .weight(.bold)
                            )
                            .multilineTextAlignment(.leading)
                            .foregroundColor(Color("Highlight"))
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .offset(x: 25, y: 15)
                        ZStack {
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 324, height: 45)
                                .background(Color("SecundaryDefault"))
                                .cornerRadius(10)
                                .padding(5)
                                .offset(y:70)
                            Text("6 de julho - 4 de setembro")
                                .font(
                                    Font.custom("SF Pro Text", size: 20)
                                        .weight(.bold)
                                )
                                .multilineTextAlignment(.leading)
                                .foregroundColor(Color("Highlight"))
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .offset(x: 25, y: 68)
                        }
                    }
                }
            }
            Spacer()
        }
        .padding(10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Base"))
        Spacer()
    }
}
