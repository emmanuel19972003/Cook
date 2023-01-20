//
//  bytype.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/17/23.
//

import Foundation



struct bytype: Codable{
    let results: [Result]
    let offset, number, totalResults: Int

}


struct Result: Codable, Hashable {
    let id: Int
    let title: String
    let image: String
    let imageType: String
}
