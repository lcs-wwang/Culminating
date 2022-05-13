//
//  MealPlan.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-11.
//

import Foundation

struct Mealplan: Decodable {
    
    let id: Int
    let title: String
    let imageType: String
    let readyInMinutes: Int
    let servings: Int
    let sourceUrl: String
    
   
}

let testMealPlan = Mealplan(id: 655219,
                            title: "Peanut Butter And Chocolate Oatmeal",
                            imageType: "jpg",
                            readyInMinutes: 45,
                            servings: 1,
                            sourceUrl: "https://spoonacular.com/recipes/peanut-butter-and-chocolate-oatmeal-655219")

let lunch = Mealplan(id: 649931,
                     title: "Lentil Salad With Vegetables",
                     imageType: "jpg",
                     readyInMinutes: 45,
                     servings: 4,
                     sourceUrl: "https://spoonacular.com/recipes/lentil-salad-with-vegetables-649931")
let dinner = Mealplan(id: 632854,
                      title: "Asian Noodles",
                      imageType: "jpg",
                      readyInMinutes: 45,
                      servings: 4,
                      sourceUrl: "https://spoonacular.com/recipes/asian-noodles-632854")
