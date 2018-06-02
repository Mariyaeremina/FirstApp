//
//  Meal.swift
//  FirstApp
//
//  Created by Мария on 29.05.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit

class Meal{
    var name: String
    var photo: UIImage?
    var calories: Int
    
    init?(name: String, photo: UIImage?, calories: Int) {
        guard !name.isEmpty else {
            return nil
        }
        self.name = name
        self.photo = photo
        self.calories = calories
    }
}
