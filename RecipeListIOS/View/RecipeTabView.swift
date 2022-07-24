//
//  RecipeTabView.swift
//  RecipeListIOS
//
//  Created by Osver Fernandez on 7/6/22.
//

import SwiftUI

struct RecipeTabView: View {
    @State var tabIndex = 0
    var body: some View {
        
        TabView(selection: $tabIndex){
            recipeFeaturedView()
            .tabItem{
                Image(systemName: "star")
                Text("Featured")
            }
            RecipeListView()
                .tabItem(){
                    Image(systemName: "list.bullet")
                    Text("List")
                }
        }
    }
}

struct RecipeTabView_Previews: PreviewProvider {
    static var previews: some View {
        RecipeTabView()
            .environmentObject(recipeLogic())
    }
}
