//
//  WebViewModel.swift
//  Culminating
//
//  Created by Winston Wang on 2022-05-12.
//

import Foundation
import SwiftUI

class WebViewModel: ObservableObject {
    @Published var isLoading: Bool = false
    @Published var canGoBack: Bool = false
    @Published var shouldGoBack: Bool = false
    @Published var title: String = ""
    
    var url: String
    
    init(url: String = "") {
        self.url = url
    }
}
