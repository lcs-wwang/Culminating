//
//  HomePageView.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-12.
//

import SwiftUI

struct HomePageView: View {
    //MARK: stored properties
    var mealPlan: Mealplan
    @State var inFavourites: Bool
    @Binding var favourites: [Mealplan]
    @State var currentMealPlan: [Mealplan] = [testMealPlan, lunch, dinner]
    var body: some View {
        NavigationView {
            VStack(alignment: .leading){
                
                //button to refresh a new meal plan
                
                
                Button(action:{
            
                    Task {
                        do {
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
                
                
                Spacer()
                
                
                Text("Lunch")
                    .font(.title2)
                Text(currentMealPlan[1].title)
                Spacer()
                
                Text("Dinner")
                    .font(.title2)
                Text(currentMealPlan[2].title)
                Spacer()
                
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
    
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(mealPlan: testMealPlan,
                     inFavourites: false,
                     favourites: .constant([]))
    }
}
