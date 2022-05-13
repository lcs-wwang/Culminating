//
//  DetailView.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-11.
//


import SwiftUI

struct DetailView: View {
    
    var mealPlan: Mealplan
    var nutritionalFacts: NutritionalFacts
    @State var inFavourites: Bool
    @Binding var favourites: [Mealplan]
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                
                HStack{
                    Text("Breakfast")
                        .font(.title2)
                    Spacer()
                    FavouritesButtonView(mealPlan: mealPlan, inFavourites: $inFavourites, favourites: $favourites)
                    
                    
                }
                Text(mealPlan.title)
                Image(mealPlan.imageType)
                
                
                Spacer()
                
                
                Text("Lunch")
                    .font(.title)
                Text(mealPlan.title)
                Image(mealPlan.imageType)
                Spacer()
                
                Text("Dinner")
                    .font(.title)
                Text(mealPlan.title)
                Image(mealPlan.imageType)
                Spacer()
                
            }
            .navigationBarTitle("Meal Plan")
            .padding()
            
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(mealPlan: testMealPlan,
                   inFavourites: false,
                   favourites: .constant([]))
    }
}
