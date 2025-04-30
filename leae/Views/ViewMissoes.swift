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
                        .foregroundColor(Color("Highlight"))
                }
                ZStack {
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 344, height: 300)
                        .background(Color("Background"))
                        .cornerRadius(10)
                    Text("Ofensivas Atuais")
                        .foregroundColor(Color("Highlight"))
                }
            }
            Spacer().frame(height: 20)
            ScrollView(.horizontal){
                HStack{
                    Spacer().frame(width: 10)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 324, height: 185)
                        .background(Color("Background"))
                        .cornerRadius(10)
                        .padding(5)
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 324, height: 185)
                        .background(Color("Background"))
                        .cornerRadius(10)
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
