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
                    List(foundMealPlans, id:\.id) {currentMealplan in
                        
                        NavigationLink(destination:
                                        DetailView(mealPlan: currentMealplan,
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
    
    //MARK: functions
    
    //https://api.spoonacular.com/mealplanner/generate?timeFrame=day
    // api key:
    // 733fb635c97d403e89b5bd4e95fccbee
    func fetchedResults() async {
        
        let url = URL(string: "https://api.spoonacular.com/mealplanner/generate?apiKey=733fb635c97d403e89b5bd4e95fccbee&timeFrame=day")!
        var request = URLRequest(url: url)
        request.setValue("application json", forHTTPHeaderField: "accept")
        request.httpMethod = "Get"
        let urlSession = URLSession.shared
        do {
            let (data, _) = try await urlSession.data(for: request)
            print(String(data: data, encoding: .utf8)!)
            let decodedSearchResult = try JSONDecoder().decode(SearchResult.self, from: data)
            foundMealPlans = decodedSearchResult.meals
        } catch {
            print("Could not retrieve / decode JSON from endpoint.")
            print(error)
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        Searchview(favourites: .constant([testMealPlan]), foundMealPlans: [])
    }
}
