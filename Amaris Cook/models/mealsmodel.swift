//
//  mealsmodel.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/17/23.
//

import Foundation
import Alamofire

extension meals {
    
    @MainActor class mealsmodel: ObservableObject{
        @Published var selected:String = "Main"
        @Published var data = bytype(results: [], offset: 0, number: 0, totalResults: 0)
        
        func fetchmeals(name:String) {
            let calls = calls()
            calls.fetchmealsbyType(name: name){ data , error in
                if (data == nil){
                    print(error)
                }else{
                    self.data = data!
                }
                
            }
        }
        
        
        func fetchdata(name:String){
            selected = name
            fetchmeals(name: name)
            
            
        }
        
        
        
        
    }
    
}
