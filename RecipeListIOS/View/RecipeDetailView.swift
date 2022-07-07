//
//  RecipeDetailView.swift
//  RecipeListIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import SwiftUI

struct RecipeDetailView: View {
    
    var recipe:recipeStructure
    
    var body: some View {
        let gradient = LinearGradient(
                gradient: Gradient(stops: [
                    .init(color: .white, location: 0),
                    .init(color: .white, location: 0.01),
                    .init(color: .clear, location: 1)
                ]),
                startPoint: .bottom,
                endPoint: .top
        )
        
        //MARK: Head VSTACK
        VStack(){
            //MARK: Head Image
            //not scrollable
            Image(recipe.image)
                .resizable(resizingMode: .stretch)
                .scaledToFill()
                .overlay(
                    gradient
                )
                .frame(minWidth: UIScreen.main.bounds.width, maxWidth:  UIScreen.main.bounds.width, minHeight:50, maxHeight: 50)
                .ignoresSafeArea()
                .aspectRatio(contentMode: .fill)
           
            
            //MARK: Head ScrollView
            ScrollView{
                
            // MARK: All Ingredients
                VStack(alignment: .leading){
                // MARK: Ingredients Headline
                VStack(){
                    Text("Ingredients: ")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.leading)
                        .lineLimit(0)
                }.padding(.leading,20)
                
                //MARK: Ingredients Content
                VStack(alignment: .leading){
                    
                    ForEach (recipe.ingredients,id: \.self){ item in
                        (Text(Image(systemName: "chevron.forward.circle.fill"))+Text(" " + item))
                            .font(.body)
                            .padding(1)
                            .padding(.leading, UIScreen.main.bounds.width/100*10)
                            .padding(.trailing, UIScreen.main.bounds.width/100*10)
                            
                    }.frame(width: UIScreen.main.bounds.width,alignment: .leading)
                }
                }
                
                Divider()
                
                
            //MARK: Directions VStack
                VStack(alignment: .leading){
                //MARK:  Directions Headline VStack
                VStack{
                    // MARK: Directions Headline
                    Text("Directions")
                        .font(.headline)
                        .foregroundColor(.blue)
                }.padding(.leading,20)
                    
                //MARK: Directions Content
                VStack(alignment: .leading){
                    ForEach (0..<recipe.directions.count ,id: \.self){ index in
                        Text(String(index+1) + ") " + recipe.directions[index])
                            .font(.body)
                            
                    }
                    .padding(.leading, UIScreen.main.bounds.width/100*10)
                    .padding(.trailing, UIScreen.main.bounds.width/100*10)
                    .padding(.vertical,10)
                    
                }.frame(maxWidth: .infinity)
                
            }
            }//End ScrollView Head
            .navigationBarTitle(recipe.name)
            
            
        }//

        
        // Mark directions
        
        
    }
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //create a dummy recipe. And pass it into the detail view so we can see a preview.
        
        let model=recipeLogic()
        
        RecipeDetailView(recipe: model.recipes[2])
    }
}
