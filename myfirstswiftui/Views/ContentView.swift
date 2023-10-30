//
//  ContentView.swift
//  myfirstswiftui
//
//  Created by Jacob Jackson on 10/29/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresented: Bool = false
    @State var leftDiceNumber = 1
    @State var rightDiceNumber = 1
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            //Color(red: 0.20, green: 0.60, blue: 0.86).edgesIgnoringSafeArea(.all)
            Image("background")
                .resizable()
                .ignoresSafeArea()
            VStack {
                Button("Show Alert") {
                    isPresented = true
                }
                .foregroundColor(.white)
                .font(.custom("Playpen Sans", size: 36))
                .alert(isPresented: $isPresented) {
                    Alert(title: Text("My Alert"),
                          message: Text("Don't ya know"),
                          dismissButton: .default(Text("Bye")))
                }
                
                DatePicker(selection: .constant(Date()), label: { Button("Roll the Dice") {
                    self.leftDiceNumber = Int.random(in: Range(1...6))
                    self.rightDiceNumber = Int.random(in: Range(1...6))
                }
                .foregroundColor(.white)
                    .font(.custom("Playpen Sans", size: 16)) })
                .datePickerStyle(.compact)
                .padding()
                
                HStack {
                    
                    DiceView(n: leftDiceNumber)
                    
                    Image("Jacob")
                        .resizable()
                        .clipShape(Circle())
                        .aspectRatio(contentMode: .fit)
                        .frame(height: 200)
                        .overlay(
                            Circle().stroke(Color.white, lineWidth: 5))
                    
                    DiceView(n: rightDiceNumber)
                    
                }.padding()
                Divider()
                
                InfoView(text: "(608) 225-2301", imageName: "phone.fill")
                InfoView(text: "jacobjackson1985@icloud.com", imageName: "envelope.fill")
                
            }
            
            NavigationView {
                List(networkManager.posts, rowContent: { post in
                    NavigationLink {
                        DetailView(url: post.url)
                    } label: {
                        HStack {
                            Text(String(post.points))
                            Text(post.title)
                        }
                    }
                }).navigationBarTitle("H4XOR NEWS")
                
            }
            .onAppear(perform: {
                networkManager.fetchData()
            })
        }
    }
}

#Preview {
    ContentView()
}
