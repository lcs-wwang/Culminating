//
//  searchResult.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-11.
//

import Foundation

struct SearchResult: Decodable {
    
    let meals: [Mealplan]
    let nutritionalFacts: NutritionalFacts
    
}
