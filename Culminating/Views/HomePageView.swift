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
    @State var currentMealPlan: Mealplan = testMealPlan
    var body: some View {
        NavigationView{
            VStack(alignment: .leading){
                
                //button to refresh a new meal plan
                
                
                Button(action:{
            
                    Task {
                        await loadNewMealPlan()
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
                Text(currentMealPlan.title1)
                
                
                Spacer()
                
                
                Text("Lunch")
                    .font(.title2)
                Text(currentMealPlan.title2)
                Spacer()
                
                Text("Dinner")
                    .font(.title2)
                Text(currentMealPlan.title3)
                Spacer()
                
            }
            .navigationBarTitle("Meal Plan")
            .padding()
            
        }
        
    }
    //MARK: functions
    //https://api.spoonacular.com/mealplanner/generate?timeFrame=day
    // api key:
    // 733fb635c97d403e89b5bd4e95fccbee
    /*
    func loadNewMealPlan() async {
        let url = URL(string: "https://api.spoonacular.com/mealplanner/generate?apiKey=733fb635c97d403e89b5bd4e95fccbee&timeFrame=day")!
        var request = URLRequest(url: url)
        request.setValue("application/json",
                         forHTTPHeaderField: "Accept")
        let urlSession = URLSession.shared
        do {
            // Get the rU.lda der aw data from the endpoint
            let (data, _) = try await urlSession.data(for: request)
            currentMealPlan = try JSONDecoder().decode(Mealplan.self, from: data)
        } catch {
            print("Could not retrieve or decode the JSON from endpoint.")
            print(error)
        }
    }
*/
    private func fetch() async throws -> loadNewMealPlan() {
        let urlsession = URLSession.shared
        let url = URL(string: "https://api.spoonacular.com/mealplanner/generate?apiKey=733fb635c97d403e89b5bd4e95fccbee&timeFrame=day")
        let (data, _) = try await URLSession.data(from: url!)
        let decoded = try JSONDecoder().decode(response.self, from: data)
        return decoded.results
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(mealPlan: testMealPlan,
                     inFavourites: false,
                     favourites: .constant([]))
    }
}
