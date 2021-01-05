//
//  Freezer.swift
//  freezer
//
//  Created by yuhori on 2021/01/05.
//

import Foundation

struct Freezer: Hashable, Codable, Identifiable {
    var id: Int
    var food_id: Int
    var num: Int
    var create_time: Data
    var update_time: Data
}
