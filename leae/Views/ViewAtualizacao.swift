//
//  ViewAtualizacao.swift
//  leae
//
//  Created by Aluno 09 on 28/04/25.
//

import SwiftUI

struct ViewAtualizacao: View {
    @State private var showSheet = false

    var body: some View {
        Button("Atualizar Leitura") {
            showSheet = true
        }
        .background( SheetPresenter(isPresented: $showSheet) {CustomSheetView()} )
    }
}

struct ViewAtualizacao_Previews: PreviewProvider {
    static var previews: some View {
        ViewAtualizacao()
    }
}

struct SheetPresenter<Content: View>: UIViewControllerRepresentable {
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

struct CustomSheetView: View {
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 0) {
                Text("Cancelar")
                    .font(
                        Font.custom("SF Pro Text", size: 15)
                        .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Hover"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text("Atualização")
                    .font(
                        Font.custom("SF Pro Text", size: 20)
                        .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Highlight"))
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("Salvar")
                    .font(
                        Font.custom("SF Pro Text", size: 15)
                        .weight(.semibold)
                    )
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color("Hover"))
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(0)
            .frame(maxWidth: .infinity, alignment: .leading)
            VStack{
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 344, height: 297)
                    .background(Color("Background"))
                    .cornerRadius(15)
                Spacer().frame(height: 20)
                Rectangle()
                    .foregroundColor(.clear)
                    .frame(width: 344, height: 88)
                    .background(Color("Background"))
                    .cornerRadius(15)
                Spacer()
            }
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Base"))
    }
}
