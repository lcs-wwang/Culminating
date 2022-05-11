//
//  CulminatingApp.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-11.
//

import SwiftUI

@main
struct CulminatingApp: App {
    //MARK: stored properties
    @State var favourite: [Mealplan] = []
    
    var body: some Scene {
        WindowGroup {
            Searchview()
        }
    }
}
