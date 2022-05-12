//
//  FavouritesView.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-11.
//

import SwiftUI

struct FavouritesView: View {
    //MARK: stored properties
    @Binding var favourites: [Mealplan]
    var body: some View {
        NavigationView{
            VStack{
                if favourites.isEmpty{
                    
                    Spacer()
                    Text("No Favourite meal plan yet")
                        .font(.title)
                        .foregroundColor(.secondary)
                    
                    Spacer()
                    
                } else {
                    List(favourites, id: \.id1) {currentMealPlan in
                        NavigationLink(destination:
                                        DetailView(mealPlan: currentMealPlan,
                                                   infavourites: true, favourites:
                            $favourites)) {
                            ListItemView(mealPlan: currentMealPlan)
                        }
                    }
                }
            }
            .navigationTitle("Favourites")
        }
        
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView(favourites: .constant([testMealPlan]))
    }
}
