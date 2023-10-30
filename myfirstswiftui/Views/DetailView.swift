//
//  DetailView.swift
//  myfirstswiftui
//
//  Created by Jacob Jackson on 10/30/23.
//

import SwiftUI

struct DetailView: View {

    let url: String?
    
    var body: some View {
        WebView(urlString: url)
    }
}

#Preview {
    DetailView(url: "https://www.google.com/")
}

