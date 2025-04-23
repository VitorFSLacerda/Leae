//
//  testeApp.swift
//  teste
//
//  Created by Aluno 11 on 11/03/25.
//

import SwiftUI

struct TitleStructure: View {
    let title: String  // No default value, must be provided when creating the view
    let sub: String
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 25, weight: .semibold))
                Spacer()
                Text(sub)
                    .font(.system(size: 12, weight: .light))
                    .foregroundColor(.blue)
                    .padding()
            }
        }
        .padding()
        .padding(.horizontal)
    }
}


// chamada: TitleStructure(title: "tituloAqui", sub: "SeuSubAqui")

struct FakeListStructure: View{
    let book: [String]
    
    var body: some View{
        //optional
        //AltZstack()
        ForEach(book, id: \.self){ books in
            VStack(spacing: 2){
                HStack{
                    Text(books)
                        .font(.system(size:16, weight: .light))
                        .padding(.horizontal,4)
                        .padding(.top, -25)
                    Spacer()
                }
                Divider()
            }
            .padding()
            .padding(.horizontal)
        }
    }
}

// chamada: FakeListStructure(books:["livro1","livro2","livro3])


@main
struct testeApp: App {
    var body: some Scene {
        WindowGroup {
                ContentView()
            }
        }
    }

