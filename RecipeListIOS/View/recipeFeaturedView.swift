//
//  recipeFeaturedView.swift
//  RecipeListIOS
//
//  Created by Osver Fernandez on 7/7/22.
//

import SwiftUI

struct recipeFeaturedView: View {
    
    @EnvironmentObject var model:recipeLogic
    
    var body: some View {
        
        VStack(alignment: .leading) {
            Text("Highlights")
                .font(.largeTitle)
                .foregroundColor(Color.gray)
            TabView{
                    ForEach(0..<model.recipes.count){ index in
                        if model.recipes[index].featured {
                            LazyVStack{
                               //$selectedIndex = index
                                Image(model.recipes[index].image)
                                    .resizable()
                                    .scaledToFill()
                                    .clipped()
                                    .frame(width: UIScreen.main.bounds.width/10*9, height: UIScreen.main.bounds.height/4*3, alignment: .center)
                                    .shadow(color: .black, radius: 5, x: 5, y: 5)
                                    .overlay {
                                        VStack{
                                            Text(model.recipes[index].name)
                                                .font(.title)
                                                .foregroundColor(Color.white)
                                                .shadow(color: .black, radius: 10, x: 5, y: 5)
                                                .shadow(color: .black, radius: 10, x: 5, y: 5)
                                                .shadow(color: .black, radius: 10, x: 5, y: 5)
                                            ForEach(0..<model.recipes[index].highlights.count){ index2 in
                                                Text(model.recipes[index].highlights[index2])
                                                    .foregroundColor(Color.white)
                                                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                                                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                                                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                                            }
                                        }
                                    }
                                

                            }
                        }
                    }
            }        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always)) // Adds a shadown to the bottom indiex view
            
        }

    }}
    

struct recipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        recipeFeaturedView()
            .environmentObject(recipeLogic())
    }
}
