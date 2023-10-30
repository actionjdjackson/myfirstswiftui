//
//  InfoView.swift
//  myfirstswiftui
//
//  Created by Jacob Jackson on 10/30/23.
//

import SwiftUI

struct InfoView: View {
    
    let text: String
    let imageName: String
    
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .foregroundColor(.white)
            .frame(height: 50)
            .overlay(
                HStack {
                    Image(systemName: imageName).foregroundColor(.blue)
                    Text(text).foregroundColor(.blue)
                }
            )
            .padding(.horizontal)
    }
}

#Preview {
    InfoView(text: "Hello", imageName: "phone.fill")
}
