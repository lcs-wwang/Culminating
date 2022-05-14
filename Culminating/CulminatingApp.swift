//
//  CulminatingApp.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-11.
//

import SwiftUI

@main
struct CulminatingApp: App {
    //MARK: stored properties
    @State var favourite: [Mealplan] = []
    
    var body: some Scene {
        WindowGroup {
            
            TabView{
                
                HomePageView(mealPlan: testMealPlan,
                             inFavourites: false,
                              favourites: $favourite)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Main")
                    }
                
                Searchview(favourites: $favourite, foundMealPlans: [])
                    .tabItem{
                        Image(systemName: "doc.text.magnifyingglass")
                        Text("Search")
                    }
                FavouritesView(favourites: $favourite)
                    .tabItem {
                        Image(systemName: "list.star")
                        Text("Favourites")
                    }
                
            }
        }
    }
}
