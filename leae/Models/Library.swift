import SwiftUI

struct LibraryBook: Identifiable {
    let id = UUID()
    let title: String
    let author: String
    let coverImage: Image
    let status: BookStatus
}

enum BookStatus {
    case reading
    case wantToRead
    case abandoned
    case have
}
