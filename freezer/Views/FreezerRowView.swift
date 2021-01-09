//
//  FreezerRowView.swift
//  freezer
//
//  Created by yuhori on 2021/01/05.
//

import SwiftUI
import CoreData

struct FreezerRowView: View {
    @EnvironmentObject var modelData: ModelData
    var item: Item

    var body: some View {
        HStack {
            let filteredFoods = modelData.foods.filter({$0.id == item.food_id})
            // TODO
            // item.create_time が nil の場合には、
            // itemFormatter で失敗する
            // Text("\(item.food_id)")
            Text("\(filteredFoods[0].name)")
            Text("\(item.num)")
            Text("\(item.limit)")
            Text("\(item.create_time!, formatter: itemFormatter)")
        }
    }
}

struct FreezerRowView_Previews: PreviewProvider {
    static var item = Item(context: PersistenceController.preview.container.viewContext)

    static var previews: some View {
        FreezerRowView(
            item: item
        )
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
