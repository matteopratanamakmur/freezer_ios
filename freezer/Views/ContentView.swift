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
        case recipes
        case foods
    }
    
    @State private var selection: Tab = .recipes

    var body: some View {
        TabView(selection: $selection) {
            RecipeListView().tabItem {
                Text("Recipes")
            }.tag(Tab.recipes)
            FoodListView().tabItem {
                Text("Foods")
            }.tag(Tab.foods)
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
