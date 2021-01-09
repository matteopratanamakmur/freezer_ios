//
//  Food.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import Foundation
import SwiftUI

struct Food: Hashable, Codable, Identifiable {
    var id: Int64
    var name: String
    var description: String
    private var imageName: String
    var image: Image {
        Image(imageName)
    }
}
