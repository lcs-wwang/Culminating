//
//  NutritionalFacts.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-13.
//

import Foundation

struct NutritionalFacts: Decodable {
    let calories: Double
    let carbohydrates: Double
    let fat: Double
    let protein: Double
}


let testNutrutionalFacts = NutritionalFacts(calories: 1735.81, carbohydrates: 235.17, fat: 69.22, protein: 55.43)
