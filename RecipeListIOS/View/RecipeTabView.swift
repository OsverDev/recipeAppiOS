//
//  RecipeTabView.swift
//  RecipeListIOS
//
//  Created by Osver Fernandez on 7/6/22.
//

import SwiftUI

struct RecipeTabView: View {
    var body: some View {
        
        TabView{
            VStack{
                Text("Featured View")
            }
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
    }
}
