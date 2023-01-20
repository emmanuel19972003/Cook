//
//  favorititem.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/18/23.
//

import Foundation
import SwiftUI
import RealmSwift

class favorititem: Object{
    @objc dynamic var img: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var id: Int = 0

}
