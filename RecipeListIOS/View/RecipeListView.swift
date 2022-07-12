//
//  ContentView.swift
//  RecipeListIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import SwiftUI

struct RecipeListView: View {
    // @ObservedObject var model = recipeLogic()
    @EnvironmentObject var model:recipeLogic
    var body: some View {
        NavigationView {
            VStack{
                Text("All Recipes")
                    .font(.largeTitle)
                    .foregroundColor(Color.gray)
                ScrollView{
                    LazyVStack(alignment: .leading){
                        ForEach(model.recipes){ r in
                            NavigationLink {
                                RecipeDetailView(recipe: r)
                            } label: {
                                HStack(alignment: .center, spacing: 20.0){
                                    Image(r.image).resizable()
                                        .scaledToFill()
                                        .frame(width: 50, height: 50, alignment: .center)
                                        .clipped()
                                        .cornerRadius(5)
                                    Text(r.name)
                                        .font(.subheadline)
                                        .foregroundColor(Color.black)
                                }
                            }
                            
                            
                            
                        }
                    }.padding(20)
                }
                .navigationBarHidden(true)
            }
        }
        
    }
}

struct RecipeListView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeListView()
            .environmentObject(recipeLogic())
    }
}
