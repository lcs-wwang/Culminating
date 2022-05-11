//
//  DetailView.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-11.
//

import SwiftUI

struct Searchview: View {
    //MARK: stored properties
    @State var searchText: String = ""
    @Binding var favourites: [Mealplan]
    
    //MARK: computed properties
    var body: some View {
        NavigationView{
            ZStack{
            Text("Enter keywor for specific food")
                .font(.title)
                .foregroundColor(.secondary)
                .navigationTitle("Meal Plan")
            }
        }
    }
}

struct SearchView: PreviewProvider {
    static var previews: some View {
        Searchview(favourites: .constant([testMealPlan]))
    }
}
