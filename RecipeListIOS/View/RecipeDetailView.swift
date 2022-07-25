//
//  RecipeDetailView.swift
//  RecipeListIOS
//
//  Created by Osver Fernandez on 7/5/22.
//

import SwiftUI

struct RecipeDetailView: View {
    @State var portionIndex:Int = 1
    
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
                    
                    //MARK: Portions
                    VStack{
                        Text("Portions")
                            .font(.headline)
                            .foregroundColor(.blue)
                            .multilineTextAlignment(.leading)
                            .lineLimit(0)
                            .shadow(color: Color.white, radius: 3, x: 0, y: 0)
                            .shadow(color: Color.white, radius: 3, x: 0, y: 0)
                        Picker("Tap Me",selection: $portionIndex){
                            ForEach(1...10,id: \.self){ i in
                                Text(String(i)).tag(i)
                            }
                        }.pickerStyle(.segmented)
                    }.padding(.horizontal,50)
                    
                // MARK: Ingredients Headline
                VStack(){
                    
                    Text("Ingredients: ")
                        .font(.headline)
                        .foregroundColor(.blue)
                        .multilineTextAlignment(.leading)
                        .lineLimit(0)
                        .shadow(color: Color.white, radius: 3, x: 0, y: 0)
                        .shadow(color: Color.white, radius: 3, x: 0, y: 0)
                }.padding(.leading,20)
                
                //MARK: Ingredients Content
                VStack(alignment: .leading){

                    ForEach (recipe.ingredients){ item in
                        HStack{
                            Text(ingredientAmountAndUnit(item,portionIndex))
                            Text(item.name)
                            
                        }
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
                        .shadow(color: Color.white, radius: 3, x: 0, y: 0)
                        .shadow(color: Color.white, radius: 3, x: 0, y: 0)
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

func ingredientAmountAndUnit (_ item: ingredients, _ portionIndex:Int) -> String {
    var itemnum:Int = 0
    var itemdenom:Int = 0
    var itemUnit:String = ""
    var isPlural:Bool = false
    
    if(item.num != nil){
        itemnum = item.num!
    }
    itemnum = itemnum * portionIndex
    
    if (item.denom != nil){
        itemdenom = item.denom!
    }else{
        itemdenom = itemnum
    }
    
    if (item.unit != nil){
        itemUnit = item.unit!
    }
    
    var msg:String = ""
    
    if(itemnum.isMultiple(of: itemdenom)){
        if(itemnum>1 && itemnum>itemdenom){
            isPlural = true
        }else{
            isPlural = false
        }
        msg = String(itemnum/itemdenom)
    }else{
        if (itemnum>itemdenom){
            isPlural = true
            msg = String(itemnum/itemdenom) + " "
            msg += String(itemnum % itemdenom) + "/" + String(itemdenom)
        }else{
            isPlural = false
            msg += String(itemnum) + "/" + String(itemdenom)
        }
    }

    
    if !itemUnit.isEmpty{
        msg += " " + itemUnit
        if isPlural{
            msg += "s"
        }
    }

    return msg
}

struct RecipeDetailView_Previews: PreviewProvider {
    static var previews: some View {
        //create a dummy recipe. And pass it into the detail view so we can see a preview.
        
        let model=recipeLogic()
        
        RecipeDetailView(recipe: model.recipes[3])
    }
}
