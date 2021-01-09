//
//  RecipeListView.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import SwiftUI
import CoreData

struct RecipeListView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.create_time, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.recipes) { recipe in
                    // TODO 作れるレシピに限定する
                    // TODO カンマ区切りでの持ち方はいまいちだと思う
                    // let foodNums = recipe.foodNums.split(separator: ",")
                    NavigationLink(destination: RecipeDetailView(recipe: recipe)) {
                        RecipeRowView(recipe: recipe)
                    }
                }
            }
            .navigationTitle("レシピ")
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
