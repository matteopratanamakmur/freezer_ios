//
//  FoodDetailView.swift
//  freezer
//
//  Created by yuhori on 2021/01/05.
//

import SwiftUI

struct FoodDetailView: View {
    var food: Food

    var body: some View {
        VStack {
            food.image
            Text(food.name)
                .font(.title)
            Text(food.description)
                .font(.body)
        }
    }
}

struct FoodDetailView_Previews: PreviewProvider {
    static var foods = ModelData().foods

    static var previews: some View {
        FoodDetailView(
            food: foods[0]
        )
    }
}
