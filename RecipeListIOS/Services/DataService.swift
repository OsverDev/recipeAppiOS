//
//  DataService.swift
//  RecipeListIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import Foundation

class dataService{
    
    //making a static function allows to call the function without having to create an instance of dataService.
    static func getLocalData() -> [recipeStructure]{
        //Parse local JSON file

        //Get a URL path to the JSON file
        let pathString  = Bundle.main.path(forResource: "recipes", ofType: "json")
        
        // Check if pathString is not nil, otherise....
        guard pathString != nil else{
            return [recipeStructure]()
        }
        
        //Create a URL object.
        let url = URL.init(fileURLWithPath: pathString!)
        //Craete a data object.
        do{
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            do{
                //Decode the data with a JSON decoder.
                let recipeData =  try decoder.decode([recipeStructure].self, from: data)
                //Add Unique IDs (UUID)
                for r in recipeData{
                    r.id = UUID()
                    
                    //Add unique IDs to recipe ingredients.
                    for i in r.ingredients{
                        i.id=UUID()
                    }
                }

                //Return the recipes.
                return recipeData
            }catch{
                //error from parsing JSON
                print(error)
            }
        }catch{
            //error with getting data.
            print(error)
        }
        
        //Add Unique IDs (UUID)
        
        //Return the recipes.
        
        return [recipeStructure]()
    }
}
