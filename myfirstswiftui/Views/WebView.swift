//
//  WebView.swift
//  myfirstswiftui
//
//  Created by Jacob Jackson on 10/30/23.
//

import Foundation
import SwiftUI
import UIKit
import WebKit

struct WebView: UIViewRepresentable {
    
    let urlString: String?
    
    func makeUIView(context: Context ) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString {
            if let url = URL(string: safeString) {
                let request = URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
    typealias UIViewType = WKWebView
}
