//
//  calls.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/19/23.
//

import Foundation
import Alamofire

class calls {
    let key = "0e8f26303ba448a088837c61c40acfd6"
    let url = "https://api.spoonacular.com/"
    
    
    func fetchmealsbyType(name:String, completion: @escaping (bytype?, Error?) -> Void) {
        let number = 5
        let typer = name
        AF.request("\(self.url)recipes/complexSearch?apiKey=\(key)&type=\(typer)&number=\(number)")
            .validate()
            .responseDecodable(of: bytype.self) { (response) in
                if let error = response.error{
                    completion(nil,error)
                }else if let meals = response.value{
                    completion(meals,nil)
                }
                
                
                
            }
    }
    func fetchRecipe(id:Int, completion: @escaping (byRecipe?, Error?) -> Void) {
        AF.request("\(self.url)recipes/\(id)/information?apiKey=\(key)")
            .validate()
            .responseDecodable(of: byRecipe.self) { (response) in
                if let error = response.error{
                    completion(nil,error)
                }else if let meals = response.value{
                    completion(meals,nil)
                }
                
            }
    }
    func fetchmeals(name:String, completion: @escaping (bytype?, Error?) -> Void) {
        let number = 7
        AF.request("\(self.url)recipes/complexSearch?apiKey=\(key)&query=\(name)&number=\(number)&addRecipeInformation=false")
            .validate()
            .responseDecodable(of: bytype.self) { (response) in
                if let error = response.error{
                    completion(nil,error)
                }else if let meals = response.value{
                    completion(meals,nil)
                }


            }
    }

    
    
}
