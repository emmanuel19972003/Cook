//
//  homemodel.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/17/23.
//

import Foundation
import Network
extension home {
    @MainActor class modelodeHome: ObservableObject{
        @Published var tap:Int = 0
        @Published var active: Bool = false
        @Published var inernet:Bool = false

                
    }
    
}
