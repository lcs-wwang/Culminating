//
//  ListedItemView.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-12.
//

import SwiftUI

struct ListItemView: View {
    
    //MARK: stored properties
    var mealPlan: Mealplan
    
    //MARK: computed properties
    var body: some View {
        VStack{
            Text(mealPlan.title1)
            
            Text(mealPlan.readyInMinutes1)
                .font(.caption)
        }
    }
}

struct ListItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListItemView(mealPlan: testMealPlan)
    }
}
