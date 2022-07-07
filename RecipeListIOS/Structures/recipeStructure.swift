//
//  recipeStructure.swift
//  RecipeListIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import Foundation

class recipeStructure: Identifiable, Decodable{
    var id:UUID?
    var name:String
    var featured:Bool
    var image:String
    var description:String
    var prepTime:String
    var cookTime:String
    var totalTime:String
    var servings:Int
    var ingredients:[String]
    var directions:[String]
}
