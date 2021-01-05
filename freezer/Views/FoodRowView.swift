//
//  FoodRowView.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import SwiftUI

struct FoodRowView: View {
    var food: Food

    var body: some View {
        HStack {
            food.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(food.name)
        }
    }
}

struct FoodRowView_Previews: PreviewProvider {
    static var foods = ModelData().foods

    static var previews: some View {
        FoodRowView(
            food: foods[0]
        )
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
