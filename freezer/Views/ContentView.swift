//
//  ContentView.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    enum Tab {
        case recipes
        case foods
    }
    
    @State private var selection: Tab = .recipes

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.create_time, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var body: some View {
        TabView(selection: $selection) {
            RecipeListView().tabItem {
                Text("Recipes")
            }.tag(Tab.recipes)
            FoodListView().tabItem {
                Text("Foods")
            }.tag(Tab.foods)
        }
//        VStack {
//            List {
//                ForEach(items) { item in
//                    Text("Item at \(item.create_time!, formatter: itemFormatter)")
//                }
//                .onDelete(perform: deleteItems)
//            }
//            .toolbar {
//                #if os(iOS)
//                EditButton()
//                #endif
//
//                Button(action: addItem) {
//                    Label("Add Item", systemImage: "plus")
//                }
//            }
//        }
    }

    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.create_time = Date()

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }

    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(ModelData())
    }
}
