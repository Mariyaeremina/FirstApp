//
//  RecipeTableViewController.swift
//  FirstApp
//
//  Created by Мария on 29.05.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit
import RealmSwift

class RecipeTableViewController: UITableViewController {
    
    var recipes = [Recipe]()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.leftItemsSupplementBackButton = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recipes.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "RecipeTableViewCell"
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? RecipeTableViewCell  else {
            fatalError("The dequeued cell is not an instance of RecipeTableViewCell.")
        }
        let recipe = recipes[indexPath.row]
        cell.nameLabel.text = recipe.title
        cell.photoImageView.image = loadImage(fileName: recipe.imagePath)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let recipeViewController = self.storyboard?.instantiateViewController(withIdentifier: "RecipeViewController") as? RecipeViewController else {
            return
        }
        let recipe = recipes[indexPath.row]
        recipeViewController.recipe = recipe
        self.navigationController?.pushViewController(recipeViewController, animated: true)
    }
    
    private func loadImage(fileName: String) -> UIImage? {
        var documentsUrl: URL {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        }
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        do {
            let imageData = try Data(contentsOf: fileURL)
            return UIImage(data: imageData)
        } catch {
            print("Error loading image : \(error)")
        } 
        return nil 
    }
    
    @IBAction func unwindToRecipeList(sender: UIStoryboardSegue) {
        if let sourceViewController = sender.source as? RecipeAddViewController, let recipe = sourceViewController.recipe {
            let newIndexPath = IndexPath(row: recipes.count, section: 0)
            recipes.append(recipe)
            tableView.insertRows(at: [newIndexPath], with: .automatic) 
        } 
    }
    
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
 
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            tableView.deleteRows(at: [indexPath], with: .fade)
            recipes[indexPath.row].delete()
            recipes.remove(at: indexPath.row)
        } else if editingStyle == .insert {
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    /*
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        super.prepare(for: seque, sender: sender)
        
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
