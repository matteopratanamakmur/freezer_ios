//
//  FreezerListView.swift
//  freezer
//
//  Created by yuhori on 2021/01/05.
//

import SwiftUI
import CoreData

struct FreezerListView: View {
    @EnvironmentObject var modelData: ModelData
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.create_time, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    @State private var selectedFoodId = 1
    @State private var selectedNum = 1
    @State private var selectedLimit = 1

    var body: some View {
        NavigationView {
            VStack{
                List {
                    ForEach(items) { item in
                        NavigationLink(destination: FreezerDetailView(item: item)) {
                            FreezerRowView(item: item)
                        }
                    }
                    // データ削除操作時に呼び出すメソッドを追加
                    .onDelete(perform: deleteItems)
                }
                Form {
                    // 食べ物選択
                    Picker(selection: $selectedFoodId, label: Text("食べ物")) {
                        ForEach(modelData.foods) { food in
                            Text(food.name).tag(food.id)
                        }
                    }
                    // 個数選択
                    Picker(selection: $selectedNum, label: Text("個数")) {
                        ForEach(1 ..< 10, id: \.self) { num in
                            Text("\(num) 個").tag(num)
                        }
                    }
                    // 期限
                    Picker(selection: $selectedLimit, label: Text("期限")) {
                        ForEach(1 ..< 10, id: \.self) { limit in
                            Text("\(limit) 日").tag(limit)
                        }
                    }
                    Button(action: {
                        // 情報を登録
                        addItem(foodId: Int64(selectedFoodId),
                                num: Int64(selectedNum),
                                limit: Int64(selectedLimit))
                    }) {
                        Text("食べ物を登録")
                    }
                }
            }
            .navigationTitle("Freezer")
        }
    }

    private func addItem(foodId: Int64, num: Int64, limit: Int64) {
        withAnimation {
            let newItem = Item(context: viewContext)
            // food_id / 個数 / 期限
            newItem.food_id = foodId
            newItem.num = num
            newItem.limit = limit
            // 作成時間 / 更新時間
            newItem.create_time = Date()
            newItem.update_time = Date()

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

struct FreezerListView_Previews: PreviewProvider {
    static var previews: some View {
        FreezerListView()
            .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
            .environmentObject(ModelData())
    }
}
