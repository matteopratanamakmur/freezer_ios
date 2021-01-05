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
        case recipe
        case freezer
        case food
    }
    
    @State private var selection: Tab = .recipe

    var body: some View {
        TabView(selection: $selection) {
            RecipeListView().tabItem {
                Text("Recipe")
            }.tag(Tab.recipe)
            FreezerListView().tabItem {
                Text("Freezer")
            }.tag(Tab.freezer)
            FoodListView().tabItem {
                Text("Food")
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
