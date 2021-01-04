//
//  RecipeRowView.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import SwiftUI

struct RecipeRowView: View {
    var recipe: Recipe

    var body: some View {
        HStack {
            recipe.image
                .resizable()
                .frame(width: 50, height: 50)
            Text(recipe.name)
            Spacer()
            // TODO 必要個数
            Text(recipe.foodNums)
        }
    }
}

struct RecipeRowView_Previews: PreviewProvider {
    static var recipes = ModelData().recipes

    static var previews: some View {
        RecipeRowView(
            recipe: recipes[0]
        )
    }
}
