//
//  DetailView.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-11.
//

import SwiftUI

struct DetailView: View {
    //MARK: stored properties
    var mealPlan: Mealplan
    @State var infavourites: Bool
    @Binding var favourites: [Mealplan]
    var body: some View {
        VStack(alignment: .leading){
            
        }
        .navigationTitle("MEAL PLAN")
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(mealPlan: testMealPlan, infavourites: false, favourites: .constant([]))
    }
}
