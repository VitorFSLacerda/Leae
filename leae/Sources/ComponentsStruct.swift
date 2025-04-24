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

struct InfoCard: View{
    let Up : String
    let Down : String
    
    var body: some View{
        ZStack(alignment: .topLeading){
                RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(.orange)
                    .frame(width: 343, height: 140)
                    .cornerRadius(20)
                    .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 0)
            VStack(spacing: 12){
                Text(Up)
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text(Down)
                    .font(.subheadline)
                    .foregroundColor(.white.opacity(0.8))
                    .lineLimit(2)
                
            }
            .padding()
        }
        .padding()
    }
}

// chamada: InfoCard(Up: "Titulo", Down: "Descrição")

struct ListCard: View{
    let title : String
    let book : [String]
    
    var body: some View{
        ZStack(alignment: .topLeading){
            RoundedRectangle(cornerRadius: 15)
                .foregroundColor(.orange)
                .frame(width: 343, height: 140)
                .cornerRadius(20)
                .shadow(color: .black.opacity(0.2), radius: 10, x: 5, y: 0)
            VStack{
                HStack(spacing: 12){
                    Text(title)
                        .font(.system(size: 25, weight: .semibold))
                }
            }
//            .padding()
//            .padding(.horizontal)
            
//            FakeListStructure(book: ["Shreck", "TVD", "Faz o urro"])
            
            ForEach(book, id: \.self){ books in
                VStack(alignment: .leading, spacing: 2){
                    HStack{
                        Text(books)
                            .font(.system(size:16, weight: .light))
                            .padding(.horizontal,4)
                            .padding(.top, 25)
                        Spacer()
                    }
                    Divider()
                }
                .padding()
            }
        }
        .padding()
    }
}

// chamada: ListCard(title: "Titulo Seção", book: ["L1","L2","L3"])

//
//@main
//struct testeApp: App {
//    var body: some Scene {
//        WindowGroup {
//                HomeView()
//            }
//        }
//    }

