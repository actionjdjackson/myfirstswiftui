//
//  DiceView.swift
//  myfirstswiftui
//
//  Created by Jacob Jackson on 10/30/23.
//

import SwiftUI

struct DiceView: View {
    
    let n: Int
    
    var body: some View {
        Image("dice\(n)")
            .resizable()
            .aspectRatio(1, contentMode: .fit)
            .padding()
    }
}


#Preview {
    DiceView(n: 3)
}
