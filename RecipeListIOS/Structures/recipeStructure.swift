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
    var highlights:[String]
    var ingredients:[ingredients]
    var directions:[String]
}

class ingredients: Identifiable, Decodable{
    var id:UUID?
    var name:String
    var num:Int?
    var denom:Int?
    var unit:String?
}
