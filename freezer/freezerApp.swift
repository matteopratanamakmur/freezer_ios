//
//  freezerApp.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import SwiftUI

@main
struct freezerApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
