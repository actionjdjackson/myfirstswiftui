//
//  PostData.swift
//  myfirstswiftui
//
//  Created by Jacob Jackson on 10/30/23.
//

import Foundation

struct Results: Decodable {
    let hits: [Post]
}


struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let title: String
    let points: Int
    let url: String?
}
