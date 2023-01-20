//
//  searchmodel.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/18/23.
//

import Foundation
import Alamofire

extension search {
    
    @MainActor class searchmodel: ObservableObject{
        @Published var search:String = ""
        @Published var isSubmited = false
        @Published var data = bytype(results: [], offset: 0, number: 0, totalResults: 0)
        
        func fetchmeals(name:String) {
            let key = "0e8f26303ba448a088837c61c40acfd6"
            let number = 5
            var name = name
            name = name.replacingOccurrences(of: " ", with: "")
            name = name.replacingOccurrences(of: "/", with: "")
            name = name.replacingOccurrences(of: ",", with: " ")
            name = name.replacingOccurrences(of: "?", with: " ")
            name = name.replacingOccurrences(of: "!", with: " ")
            let calls = calls()
            calls.fetchmeals(name: name){ data , error in
                if (data == nil){
                    print(error)
                }else{
                    self.data = data!
                    print(self.data)
                }
                
            }        }
        
    }
}


