//
//  MealPlan.swift
//  FirstApp
//
//  Created by Мария on 02.06.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit

enum PlanType: String{
    case balanced = "balanced"
    case lowFats = "lowFats"
    case lowCarbohdr = "lowCarbohdr"
}

struct Nutrients{
    var protein = 0.0
    var carbohdr = 0.0
    var fat = 0.0
    var calories = 0.0
}

class MealPlan{
    let user: User
    var planType: PlanType
    var nutrients: Nutrients
    
    init(user : User) {
        self.user = user
        nutrients = Nutrients()
        planType = PlanType.balanced
    }
    
    private func getBasicCalories() -> Int{
        return 2000
    }
    
    public func getNutrientsCount() -> Nutrients{
        switch planType{
        case .balanced:
            nutrients.protein = nutrients.calories * 0.25 / 4
            nutrients.carbohdr = nutrients.calories * 0.50 / 4
            nutrients.fat = nutrients.calories * 0.25 / 9
        case .lowFats:
            nutrients.protein = nutrients.calories * 0.25 / 4
            nutrients.carbohdr = nutrients.calories * 0.60 / 4
            nutrients.fat = nutrients.calories * 0.15 / 9
        case .lowCarbohdr:
            nutrients.protein = nutrients.calories * 0.40 / 4
            nutrients.carbohdr = nutrients.calories * 0.25 / 4
            nutrients.fat = nutrients.calories * 0.35 / 9
        }
        return nutrients
    }
    

}
