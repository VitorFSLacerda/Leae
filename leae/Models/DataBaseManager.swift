import Foundation

class DatabaseManager {
    static let shared = DatabaseManager()
    
    private let userDefaultsKey = "LoggedInUser"
    
    // Salvar usuário no UserDefaults
    func saveUser(_ user: Usuario) {
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(user) {
            UserDefaults.standard.set(encodedData, forKey: userDefaultsKey)
        }
    }
    
    // Recuperar usuário do UserDefaults
    func getUser() -> Usuario? {
        if let savedData = UserDefaults.standard.data(forKey: userDefaultsKey) {
            let decoder = JSONDecoder()
            if let user = try? decoder.decode(Usuario.self, from: savedData) {
                return user
            }
        }
        return nil
    }
    
    // Remover usuário do UserDefaults (logout)
    func deleteUser() {
        UserDefaults.standard.removeObject(forKey: userDefaultsKey)
    }
}
