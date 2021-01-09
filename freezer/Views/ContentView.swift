//
//  ContentView.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import SwiftUI
import CoreData

struct ContentView: View {
    enum Tab {
        case freezer
        case recipe
        case food
    }
    
    @State private var selection: Tab = .freezer

    var body: some View {
        TabView(selection: $selection) {
            FreezerListView().tabItem {
                Text("冷蔵庫")
            }.tag(Tab.freezer)
            RecipeListView().tabItem {
                Text("レシピ")
            }.tag(Tab.recipe)
            FoodListView().tabItem {
                Text("食べ物")
            }.tag(Tab.food)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(ModelData())
    }
}
