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
                
                HomePageView(nutritionalFacts: testNutrutionalFacts, mealPlan: testMealPlan,
                             inFavourites: false,
                              favourites: $favourite)
                    .tabItem {
                        Image(systemName: "house")
                        Text("Main")
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
