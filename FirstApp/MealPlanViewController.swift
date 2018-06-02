//
//  MealPlanViewController.swift
//  FirstApp
//
//  Created by Мария on 02.06.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit
import DLRadioButton

class MealPlanViewController: UIViewController {
    
    var user: User?
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var carbohdr: UILabel!
    @IBOutlet weak var fats: UILabel!
    @IBOutlet weak var proteins: UILabel!
    @IBOutlet weak var normal: DLRadioButton!
    @IBOutlet weak var lowFats: DLRadioButton!
    @IBOutlet weak var lowCarbohdr: DLRadioButton!
    
    @IBAction func getValues(_ sender: UIButton) {
        
        var plan: PlanType
        if normal.isSelected{
            plan = PlanType.balanced
        } else if lowFats.isSelected{
            plan = PlanType.lowFats
        } else {
            plan = PlanType.lowCarbohdr
        }
        let mealPlan = MealPlan(user: user!)
        mealPlan.planType = plan
        let nutrients = mealPlan.getNutrientsCount()
        proteins.text = String(Int(nutrients.protein)) + " гр"
        fats.text = String(Int(nutrients.fat)) + " гр"
        carbohdr.text = String(Int(nutrients.carbohdr)) + " гр"
        calories.text = String(nutrients.calories)
    }
    
    @IBAction func getMenu(_ sender: UIButton) {
        guard let mealTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "MealTableViewController") as? MealTableViewController else {
            return
        }
        mealTableViewController.nutrients = MealPlan(user: user!).getNutrientsCount()
        self.navigationController?.pushViewController(mealTableViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
