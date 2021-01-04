//
//  RecipeListView.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import SwiftUI

struct RecipeListView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        List {
            ForEach(modelData.recipes) { recipe in
                RecipeRowView(recipe: recipe)
            }
        }
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var recipes = ModelData().recipes

    static var previews: some View {
        RecipeListView()
            .environmentObject(ModelData())
    }
}
