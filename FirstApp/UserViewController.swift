//
//  UserViewController.swift
//  FirstApp
//
//  Created by Мария on 02.06.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit
import DLRadioButton

class UserViewController: UIViewController {

    
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var ageTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var maleRadioButton: DLRadioButton!
    @IBOutlet weak var femaleRadioButton: DLRadioButton!
    var user: User?
    
    @IBAction func next(_ sender: UIButton) {
        var gender : String
        if maleRadioButton.isSelected{
            gender = Gender.male.rawValue
        } else{
            gender = Gender.female.rawValue
        }
        let nameFromTextField = nameTextField.text!
        let heightFromTextField = Int(heightTextField.text!)
        let weightFromTextField = Int(weightTextField.text!)
        let ageFromTextField = Int(ageTextField.text!)
        user = User.init(name: nameFromTextField,
                             gender: gender,
                             height: heightFromTextField!,
                             weight : weightFromTextField!,
                             age : ageFromTextField!)
        user?.write()
        
        guard let mealPlanViewController = self.storyboard?.instantiateViewController(withIdentifier: "MealPlaneViewController") as? MealPlanViewController else {
            return
        }
        mealPlanViewController.user = user
        self.navigationController?.pushViewController(mealPlanViewController, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
