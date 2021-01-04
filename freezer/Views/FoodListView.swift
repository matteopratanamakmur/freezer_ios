//
//  FoodListView.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import SwiftUI

struct FoodListView: View {
    var foods: [Food]

    var body: some View {
        List {
            ForEach(foods) { food in
                FoodRowView(food: food)
            }
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var foods = ModelData().foods

    static var previews: some View {
        FoodListView(
            foods: foods
        )
    }
}
