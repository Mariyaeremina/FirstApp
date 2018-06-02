//
//  User.swift
//  FirstApp
//
//  Created by Мария on 01.06.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit
import RealmSwift

enum Gender: String{
    case male = "male", female = "female"
}

class User: Object {
    dynamic var user_id = NSUUID().uuidString
    dynamic var name = ""
    dynamic var gender = ""
    dynamic var height = 0
    dynamic var weight = 0
    dynamic var age = 0
    
    convenience init(name: String,
                     gender: String,
                     height: Int,
                     weight: Int,
                     age: Int) {
        self.init()
        self.name = name
        self.gender = gender
        self.height = height
        self.weight = weight
        self.age = age
    }
   
    public func write(){
        let realm = try! Realm()
        while(true) {
            let newId = NSUUID().uuidString
            let response = realm.object(ofType: User.self, forPrimaryKey: newId)
            if(response == nil) {
                self.user_id = newId
                break
            }
        }
        try! realm.write {
            realm.add(self)
        }
    }
}
