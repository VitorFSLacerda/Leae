//
//  GroupModal.swift
//  leae
//
//  Created by Aluno 11 on 29/04/25.
//

import SwiftUI

struct GroupModal: View {
    @Binding var showModal : Bool
    
    var body: some View {
        VStack{
            if showModal {
                Text("Conteúdo do Modal")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            
        }
    }
}


