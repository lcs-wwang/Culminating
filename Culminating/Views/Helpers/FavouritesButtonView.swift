//
//  FavouritesButtonView.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-12.
//

import SwiftUI

struct FavouritesButtonView: View {
    //MARK: stored properties
    let mealPlan: Mealplan
    @Binding var inFavourites : Bool
    @Binding var favourites: [Mealplan]
    //MARK: computed properties
    var body: some View {
        Button(action: {
            addorRemoveMealPlanFromFavourites()
        }) {
            HStack{
                Text(inFavourites ? "Remove from\nfavourites" :"Add to\nFavourites")
                    .multilineTextAlignment(.center)
                Image(systemName: inFavourites ? "suit.heart.fill" : "suit.heart")
                    .resizable()
                    .frame(width: 40, height: 40)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("deepRed"))
            }
        }
    }
    //MARK: functions
    func addorRemoveMealPlanFromFavourites() {
        if inFavourites == false{
            favourites.append(mealPlan)
            inFavourites = true
        } else {
            favourites.removeAll(where: {currentMealPlanInList in
                currentMealPlanInList.id1 == mealPlan.id1
            })
            inFavourites = false
        }
            
    }
}

struct FavouritesButtonView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesButtonView(mealPlan: testMealPlan, inFavourites: .constant(true), favourites: .constant([]))
    }
}
