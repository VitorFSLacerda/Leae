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
    let dias = ["Seg", "Ter", "Qua", "Qui", "Sex", "Sab", "Dom"]
    
    var body: some View {
        VStack{
            HStack {
                Text("Cancelar")
                    .font(
                        Font.custom("SF Pro Text", size: 15)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Hover"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Constância")
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                            .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Highlight"))
                    .frame(maxWidth: .infinity, alignment: .center)
                    .offset(x: -85)
            }
            .frame(width: .infinity, height: 30, alignment: .center)
            .padding(5)
            VStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 344, height: 100)
                    .background(Color("Background"))
                    .cornerRadius(10)
                    .padding(5)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 344, height: 260)
                    .background(Color("Background"))
                    .cornerRadius(10)
            }
            .padding(5)
            ScrollView(.horizontal){
                HStack(spacing: 5) {
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
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Base"))
        Spacer()
    }
}
