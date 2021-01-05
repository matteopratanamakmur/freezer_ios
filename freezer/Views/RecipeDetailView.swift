//
//  RecipeDetailView.swift
//  freezer
//
//  Created by yuhori on 2021/01/05.
//

import SwiftUI

struct RecipeDetailView: View {
    var recipe: Recipe

    var body: some View {
        VStack {
            recipe.image
            Text(recipe.name)
                .font(.title)
            Text(recipe.description)
                .font(.body)
        }
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var recipes = ModelData().recipes

    static var previews: some View {
        RecipeDetailView(
            recipe: recipes[0]
        )
    }
}
