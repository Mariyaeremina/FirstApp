//
//  Recipe.swift
//  FirstApp
//
//  Created by Мария on 03.06.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit
import RealmSwift

class Recipe: Object {
    dynamic var title = ""
    dynamic var imagePath = ""
    dynamic var instruction = ""
    let ingredients = List<Ingredient>()
    
    public func write(){
        try! realm?.write {
            realm?.add(self)
        }
    }
    
    public func delete(){
        try! realm?.write{
            realm?.delete(self)
        }
    }

}
