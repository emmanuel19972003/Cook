//
//  favoritemodel.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/18/23.
//

import Foundation
import RealmSwift
extension favorite {
    @MainActor class favoritemodel: ObservableObject{
        @Published var data: [favorititem] = []
        
        func getData(){
            let persitencia = persistent()
            let data = persitencia.fetch()
            self.data = Array(data)
        }
        
        func delit(item: favorititem){
            let persitencia = persistent()
            persitencia.delete(img: item.img, title: item.title, id: item.id)
        }
        

        
                
    }
    
}
