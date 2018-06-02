//
//  Menu.swift
//  FirstApp
//
//  Created by Мария on 30.05.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit
import RealmSwift

class Menu : Object{
    
 
    var nameOwner : String
    var calories : Int
    var meals : [Meal]
    
    init?(calories: Int, meals: [Meal], nameOwner: String) {
        
        self.calories = calories
        self.meals = meals
        self.nameOwner = nameOwner
    }
    
}

