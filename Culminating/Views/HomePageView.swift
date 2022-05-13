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
    
    var body: some View {
        NavigationView{
            VStack{
                
                Text("Breakfast")
                    .font(.title2)
                Text(mealPlan.title1)
                Spacer()
                
                Text("Lunch")
                    .font(.title2)
                Text(mealPlan.title2)
                Spacer()
                
                Text("Dinner")
                    .font(.title2)
                Text(mealPlan.title3)
                Spacer()
                
            }
            .navigationBarTitle("Meal Plan")
            .padding()
            
        }
        
    }
}

struct HomePageView_Previews: PreviewProvider {
    static var previews: some View {
        HomePageView(mealPlan: testMealPlan)
    }
}
