import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Spacer()
            Image("App")
                .resizable()
                .scaledToFit()
                .frame(width: 500, height: 500)
                .shadow(color: .black.opacity(0.4), radius: 5, x: 0, y: 10)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color("Hover"))
        .ignoresSafeArea()
    }
}
///
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            ContentView()
        }
    }
}
