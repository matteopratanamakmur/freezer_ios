//
//  FoodListView.swift
//  freezer
//
//  Created by yuhori on 2021/01/04.
//

import SwiftUI

struct FoodListView: View {
    @EnvironmentObject var modelData: ModelData

    var body: some View {
        NavigationView {
            List {
                ForEach(modelData.foods) { food in
                    NavigationLink(destination: FoodDetailView(food: food)) {
                        FoodRowView(food: food)
                    }
                }
            }
            .navigationTitle("Food")
        }
    }
}

struct FoodListView_Previews: PreviewProvider {
    static var foods = ModelData().foods

    static var previews: some View {
        FoodListView()
            .environmentObject(ModelData())
    }
}
