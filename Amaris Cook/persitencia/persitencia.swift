//
//  persitencia.swift
//  Amaris Cook
//
//  Created by Emmanuel Zambrano Quitian on 1/18/23.
//

import Foundation
import RealmSwift
import SwiftUI

//@objc dynamic var img: String?
//@objc dynamic var title: String?
//@objc dynamic var id: String?

class persistent{
    
    func saveObj (img:String, title:String, id:Int){
        let favorite = favorititem()
        favorite.img = img
        favorite.title = title
        favorite.id = id
        let realm = try! Realm()
        realm.beginWrite()
        realm.add(favorite)
        try! realm.commitWrite()
    }
    
    func fetch () -> Results<favorititem>{
        let realm = try! Realm()
        let favs = try! realm.objects(favorititem.self)
        return favs
    }
    func delete (img:String, title:String, id:Int){
        let favorite = favorititem()
        favorite.img = img
        favorite.title = title
        favorite.id = id
        let realm = try! Realm()
        
        realm.beginWrite()
        realm.delete(realm.objects(favorititem.self).filter("id=%@",favorite.id))
        try! realm.commitWrite()
        
        
        
                
        
    }
}



