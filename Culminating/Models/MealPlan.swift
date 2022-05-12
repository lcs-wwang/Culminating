//
//  MealPlan.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-11.
//

import Foundation

struct Mealplan: Decodable {
    
    //breakfast
    let id1: Int
    let title1: String
    let imageType1: String
    let readyInMinutes1: Int
    let servings1: Int
    let sourceUrl1: String
    
    //lunch
    let id2: Int
    let title2: String
    let imageType2: String
    let readyInMinutes2: Int
    let servings2: Int
    let sourceUrl2: String
    
    //dinner
    let id3: Int
    let title3: String
    let imageType3: String
    let readyInMinutes3: Int
    let servings3: Int
    let sourceUrl3: String
    
    //nutritional fact
    let calories: Double
    let fat: Double
    let protein: Double
}

let testMealPlan = Mealplan(id1: 655219,
                            title1: "Peanut Butter And Chocolate Oatmeal",
                            imageType1: "jpg",
                            readyInMinutes1: 45,
                            servings1: 1,
                            sourceUrl1: "https://spoonacular.com/recipes/peanut-butter-and-chocolate-oatmeal-655219", id2: 649931, title2: "Lentil Salad With Vegetables",
                            imageType2: "jpg",
                            readyInMinutes2: 45,
                            servings2: 4,
                            sourceUrl2: "https://spoonacular.com/recipes/lentil-salad-with-vegetables-649931",
                            id3: 632854,
                            title3: "Asian Noodles",
                            imageType3: "jpg",
                            readyInMinutes3: 45,
                            servings3: 4,
                            sourceUrl3: "https://spoonacular.com/recipes/asian-noodles-632854",
                            calories: 1735.81,
                            fat: 69.22,
                            protein: 55.43)
