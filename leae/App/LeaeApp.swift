import SwiftUI

@main
struct LeaeApp: App {
    @AppStorage("isLoggedIn") private var isLoggedIn = false

    var body: some Scene {
        WindowGroup {
            if isLoggedIn {
                MainAppView()
                    .id("mainAppView") // Força a reconstrução da view
            } else {
                LoginView()
                    .id("loginView") // Força a reconstrução da view
            }
        }
    }
}
