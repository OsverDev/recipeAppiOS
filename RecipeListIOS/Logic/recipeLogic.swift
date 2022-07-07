//
//  recipeLogic.swift
//  RecipeListIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import Foundation

class recipeLogic:ObservableObject{
    @Published var recipes = [recipeStructure]()
    init(){
        //Create an instance of data Service and get the data.
        //let service = dataService() //not needed bc getLocalData was declared as static.
        self.recipes = dataService.getLocalData()
        
    }
}
