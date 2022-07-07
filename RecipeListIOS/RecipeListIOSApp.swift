//
//  RecipeListIOSApp.swift
//  RecipeListIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import SwiftUI

@main
struct RecipeListIOSApp: App {
    var body: some Scene {
        WindowGroup {
            RecipeTabView()
                .environmentObject(recipeLogic())
        }
    }
}
