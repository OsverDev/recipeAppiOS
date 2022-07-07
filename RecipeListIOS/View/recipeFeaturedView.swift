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
       // GeometryReader{ geo in
            TabView{
                
                ForEach(0..<model.recipes.count){ index in
                    if model.recipes[index].featured {
                        Image(model.recipes[index].image)
                            .resizable()
                            .scaledToFill()
                            .clipped()
                            .frame(width: UIScreen.main.bounds.width/10*9, height: UIScreen.main.bounds.height/4*3, alignment: .center)
                            .shadow(color: .black, radius: 10, x: 5, y: 5)
                            .overlay {
                                Text(model.recipes[index].name)
                                    .font(.title)
                                    .foregroundColor(Color.white)
                                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                                    .shadow(color: .black, radius: 10, x: 5, y: 5)
                            }
                        
                            
                    }
                }
            }        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
            .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))

    }}
    

struct recipeFeaturedView_Previews: PreviewProvider {
    static var previews: some View {
        recipeFeaturedView()
            .environmentObject(recipeLogic())
    }
}
