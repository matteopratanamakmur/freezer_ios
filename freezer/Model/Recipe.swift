//
//  Recipe.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import Foundation
import SwiftUI

struct Recipe: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var description: String
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
    var foodNums: String
}
