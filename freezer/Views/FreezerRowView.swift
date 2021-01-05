//
//  FreezerRowView.swift
//  freezer
//
//  Created by yuhori on 2021/01/05.
//

import SwiftUI
import CoreData

struct FreezerRowView: View {
    var item: Item

    var body: some View {
        HStack {
            Text("\(item.id)")
            Text("\(item.food_id)")
            Text("\(item.num)")
            Text("\(item.create_time!, formatter: itemFormatter)")
            Text("\(item.update_time!, formatter: itemFormatter)")
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct FreezerRowView_Previews: PreviewProvider {
    static var item = Item(context: PersistenceController.preview.container.viewContext)

    static var previews: some View {
        FreezerRowView(
            item: item
        )
        .previewLayout(.fixed(width: 300, height: 70))
    }
}
