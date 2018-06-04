//
//  MainViewController.swift
//  FirstApp
//
//  Created by Мария on 02.06.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBAction func getAllRecipes(_ sender: UIButton) {
        guard let recipeTableViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecipeTableViewController") as? RecipeTableViewController else {
            return
        }
        self.navigationController?.pushViewController(recipeTableViewController, animated: true)
    }
    
    @IBAction func getRandomRecipes(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}

