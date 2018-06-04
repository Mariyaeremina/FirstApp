//
//  Ingredient.swift
//  FirstApp
//
//  Created by Мария on 03.06.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit
import RealmSwift

class Ingredient: Object {
    dynamic var name = ""
    dynamic var amount = 0
    dynamic var unit = ""
}
