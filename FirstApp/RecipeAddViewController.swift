//
//  RecipeAddViewController.swift
//  FirstApp
//
//  Created by Мария on 04.06.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit
import os.log

class RecipeAddViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var instructionTextView: UITextView!
    @IBOutlet weak var ingredientTextView: UITextView!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var photoImage: UIImageView!
    var recipe: Recipe?
    override func viewDidLoad() {
        super.viewDidLoad()

        let borderColor : UIColor = UIColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1.0)
        ingredientTextView.layer.borderWidth = 0.5
        ingredientTextView.layer.borderColor = borderColor.cgColor
        ingredientTextView.layer.cornerRadius = 5.0
        instructionTextView.layer.borderWidth = 0.5
        instructionTextView.layer.borderColor = borderColor.cgColor
        instructionTextView.layer.cornerRadius = 5.0
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        photoImage.image = selectedImage
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil) 
    }
    
    @IBAction func selectImage(_ sender: UITapGestureRecognizer) {
        
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self
        present(imagePickerController, animated: true, completion: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button === saveButton else {
            return
        }
        let title = titleTextField.text ?? ""
        let photo = saveImage(image: photoImage.image!, fileName: title + ".jpg")
        let instruction = instructionTextView.text ?? ""
        let ingredients = getIngredients(text: ingredientTextView.text ?? "")
        recipe = Recipe(value: [title, photo ?? "", ingredients, instruction])
        recipe?.write()
    }
    
    private func getIngredients(text: String) -> [Ingredient]{
        var ingredientsList = [Ingredient]()
        let textArray = text.components(separatedBy: "\n")
        for elem in textArray{
            let temp = elem.components(separatedBy: ",")
            let titleRecipe = temp[0].trimmingCharacters(in: .whitespaces)
            let amount = temp[1].trimmingCharacters(in: .whitespaces).components(separatedBy: " ")
            ingredientsList.append(Ingredient(value: [titleRecipe, Int(amount[0]) ?? 0, amount[1]]))
        }
        return ingredientsList
    }
    
    private func saveImage(image: UIImage, fileName: String) -> String? {
        var documentsUrl: URL {
            return FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        }
        let fileURL = documentsUrl.appendingPathComponent(fileName)
        if let imageData = UIImageJPEGRepresentation(image, 1.0) {
            try? imageData.write(to: fileURL, options: .atomic)
            return fileName // —--> Save fileName
        } 
        print("Error saving image") 
        return ""
    }
    
    @IBAction func cancel(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
}
