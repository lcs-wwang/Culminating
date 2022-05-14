//
//  HomePageView.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-12.
//

import SwiftUI

struct HomePageView: View {
    //MARK: stored properties
    var nutritionalFacts: NutritionalFacts
    var mealPlan: Mealplan
    @State var inFavourites: Bool
    @Binding var favourites: [Mealplan]
    @State var currentMealPlan: [Mealplan] = [testMealPlan, lunch, dinner]
    @State var currentNutritionalFacts = testNutrutionalFacts
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                
                //button to refresh a new meal plan
                
                
                Button(action:{
            
                    Task {
                        do {
                            try await loadNewNutritionalFacts()
                            try await loadNewMealPlan()
                            inFavourites = false
                        } catch {
                            print(error.localizedDescription)
                        }
                    }
                    
                }, label: {
                    Text("Click to Refresh")
                })
                    .buttonStyle(.plain)
                    .padding()
                
                
                HStack{
                    Text("Breakfast")
                        .font(.title2)
                    Spacer()
                    FavouritesButtonView(mealPlan: mealPlan, inFavourites: $inFavourites, favourites: $favourites)
                    
                }
                
                Text(currentMealPlan[0].title)
                    .font(.title3)
                Text(currentMealPlan[0].imageType)
                Text(currentMealPlan[0].readyInMinutes)
                Text(currentMealPlan[0].servings)
                
                
                Spacer()
                
                
                Text("Lunch")
                    .font(.title2)
                Text(currentMealPlan[1].title)
                    .font(.title3)
                Text(currentMealPlan[1].imageType)
                Text(currentMealPlan[1].readyInMinutes)
                Text(currentMealPlan[1].servings)
                Spacer()
                
                Text("Dinner")
                    .font(.title2)
                Text(currentMealPlan[2].title)
                    .font(.title3)
                Text(currentMealPlan[2].imageType)
                Text(currentMealPlan[2].readyInMinutes)
                Text(currentMealPlan[2].servings)
                Spacer()
                
                Divider
                
                Text(nutritionalFacts.protein)
                Text(nutritionalFacts.fat)
                Text(nutritionalFacts.calories)
                Text(nutritionalFacts.carbohydrates)
                
            }
            .navigationBarTitle("Meal Plan")
            .padding()
        }
        .task {
            do {
               try await loadNewMealPlan()
            } catch {
                print(error)
            }
        }
        
    }
    //MARK: functions
   
    func loadNewMealPlan() async throws {
        let urlsession = URLSession.shared
        let url = URL(string: "https://api.spoonacular.com/mealplanner/generate?apiKey=733fb635c97d403e89b5bd4e95fccbee&timeFrame=day")
        let (data, _) = try await urlsession.data(from: url!)
        let decoded = try JSONDecoder().decode(SearchResult.self, from: data)
        currentMealPlan = decoded.meals
        
    }
    
    func loadNewNutritionalFacts() async throws{
        let urlsession = URLSession.shared
        let url = URL(string: "https://api.spoonacular.com/mealplanner/generate?apiKey=733fb635c97d403e89b5bd4e95fccbee&timeFrame=day")
        let (data, _) = try await urlsession.data(from: url!)
        let decoded = try JSONDecoder().decode(SearchResult.self, from: data)
        currentNutritionalFacts = decoded.nutrients
    }
    
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(nutritionalFacts: testNutrutionalFacts, mealPlan: testMealPlan,
                     inFavourites: false,
                     favourites: .constant([]))
    }
}
