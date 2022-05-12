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
    @State var foundMealPlans: [Mealplan]
    
    //MARK: computed properties
    var body: some View {
        NavigationView{
            ZStack{
                VStack{
                    List(foundMealPlans, id:\.id1) {currentMealplan in
                        
                        NavigationLink(destination:
                                        DetailView(Mealplan: currentMealplan,
                                                   inFavourites: false, favourites:
                                                    $favourites)) {
                            ListItemView(mealPlan: currentMealplan)
                        }
                    }
                    .searchable(text: $searchText)
                    .onChange(of: searchText){ whatWasTyped in
                        Task{
                            await fetchedResults()
                        }
                        
                    }
                    
                }
                .navigationTitle("Daily Meal Plan")
                VStack{
                    
                    Text("Enter keywor for specific food")
                        .font(.title)
                        .foregroundColor(.secondary)
                    Spacer()
                }
                .opacity(searchText.isEmpty ? 1.0 : 0.0)
            }
        }
    }
}

struct SearchView: PreviewProvider {
    static var previews: some View {
        Searchview(favourites: .constant([testMealPlan]))
    }
}
