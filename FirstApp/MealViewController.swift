//
//  MealViewController.swift
//  FirstApp
//
//  Created by Мария on 29.05.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit

class MealViewController: UIViewController{
    
    var nutrients: Nutrients?
    var meal: Meal?
    @IBOutlet weak var fatsLabel: UILabel!
    @IBOutlet weak var proteinsLabel: UILabel!
    @IBOutlet weak var carbohdrLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameLabel.text = meal?.name
        photoImage.image = meal?.photo
        fatsLabel.text = String(Int((nutrients?.fat)! * 0.3)) + " гр"
        proteinsLabel.text = String(Int((nutrients?.protein)! * 0.3)) + " гр"
        carbohdrLabel.text = String(Int((nutrients?.carbohdr)! * 0.3)) + " гр"
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
