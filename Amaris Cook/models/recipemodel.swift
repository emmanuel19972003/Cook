//
//  recipemodel.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/18/23.
//

import Foundation
import Alamofire
extension recipe {
    
    @MainActor class recipemodel: ObservableObject{
        @Published var id:Int = 0
        @Published var favorite:Bool = false
        @Published var selected:String = "Instructions"
        @Published var data = byRecipe(vegetarian: false, vegan: false, glutenFree: false, dairyFree: false, veryHealthy: false, cheap: false, veryPopular: false, sustainable: false, lowFodmap: false, weightWatcherSmartPoints: 0, gaps: "", preparationMinutes: 0, cookingMinutes: 0, aggregateLikes: 0, healthScore: 0, creditsText: "" /*, license: ""*/, sourceName: "", pricePerServing: 0.0, extendedIngredients: [], id: 0, title: "", readyInMinutes: 0, servings: 0, sourceURL: "", image: "", imageType: "", summary: "", cuisines: [], dishTypes: [], diets: [], occasions: [], winePairing: WinePairing(pairedWines: [], pairingText: "", productMatches: []), instructions: "", analyzedInstructions: [], originalID: nil, spoonacularSourceURL: "")
        
        func setFavorite(){
            
            let data = favorititem()
            data.id = self.data.id
            data.title = self.data.title
            data.img = self.data.image
            let persistencia = persistent()
            if (favorite){
                persistencia.delete(img: data.img, title: data.title, id: data.id)
            }else{
                persistencia.saveObj(img: data.img, title: data.title, id: data.id)
            }
            
            
            favorite.toggle()
        }
        func checkFavorite(){
            let persitencia = persistent()
            let dataper = persitencia.fetch()
            let matchs = dataper.first { favorititem in
                favorititem.id == self.id
            }
            if ((matchs) != nil){
                self.favorite = true
            }else{
                self.favorite = false
            }
        }
        
        func setSelected(_ st:String){
            selected = st
        }
        
        func cleanString(_ msj:String) -> String{
            var msj = msj
            msj = msj.replacingOccurrences(of: "<ol><li><span></span>", with: "")
            msj = msj.replacingOccurrences(of: "</li><li>", with: "\n")
            msj = msj.replacingOccurrences(of: "<b>", with: " ")
            msj = msj.replacingOccurrences(of: "</b>", with: " ")
            msj = msj.replacingOccurrences(of: "<a>", with: " ")
            msj = msj.replacingOccurrences(of: "<a href=", with: " ")
            msj = msj.replacingOccurrences(of: "</a>", with: " ")
            return msj
        }
        func fetchRecipe() {
            let calls = calls()
            calls.fetchRecipe(id: self.id){ data , error in
                if (data == nil){
                    print(error)
                }else{
                    self.data = data!
                }
                
            }
        }
        
    }
}
