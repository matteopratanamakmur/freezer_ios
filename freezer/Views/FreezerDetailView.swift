//
//  FreezerDetailView.swift
//  freezer
//
//  Created by yuhori on 2021/01/05.
//

import SwiftUI
import CoreData

struct FreezerDetailView: View {
    var item: Item

    var body: some View {
        VStack {
            // TODO
            // item.create_time が nil の場合には、
            // itemFormatter で失敗する
            Text("\(item.food_id)")
            Text("\(item.num)")
            Text("\(item.limit)")
            Text("\(item.create_time!, formatter: itemFormatter)")
        }
    }
}

struct FreezerDetailView_Previews: PreviewProvider {
    static var item = Item(context: PersistenceController.preview.container.viewContext)

    static var previews: some View {
        FreezerDetailView(
            item: item
        )
    }
}
