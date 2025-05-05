// UserDataManager.swift
import Foundation

func salvarUsuarioNoKeychain(usuario: Usuario, email: String) -> Bool {
    let encoder = JSONEncoder()
    do {
        let jsonData = try encoder.encode(usuario)
        return KeychainHelper.save(key: email, data: jsonData)
    } catch {
        print("Erro ao codificar o usuário: \(error.localizedDescription)")
        return false
    }
}

func recuperarUsuarioDoKeychain(email: String) -> Usuario? {
    if let userData = KeychainHelper.load(key: email) {
        let decoder = JSONDecoder()
        do {
            let usuario = try decoder.decode(Usuario.self, from: userData)
            return usuario
        } catch {
            print("Erro ao decodificar o usuário: \(error.localizedDescription)")
            return nil
        }
    } else {
        print("Nenhum dado encontrado no Keychain para o email: \(email)")
        return nil
    }
}
