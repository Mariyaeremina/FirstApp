//
//  RecipeViewController.swift
//  FirstApp
//
//  Created by Мария on 29.05.18.
//  Copyright © 2018 Мария. All rights reserved.
//

import UIKit

class RecipeViewController: UIViewController{
    
    @IBOutlet weak var myView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var photoImage: UIImageView!
    var recipe: Recipe?
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = recipe?.title
        photoImage.image = UIImage(named: (recipe?.imagePath)!)
        load()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    private func load(){
        var labelsArray = [UILabel]()
        let ingredientTitle = UILabel()
        ingredientTitle.text = "Ingredients:"
        labelsArray.append(ingredientTitle)
        
        for elem in (recipe?.ingredients)!{
            let temp = UILabel()
            temp.text = String(elem.amount) + " " + elem.unit + " " + elem.name
            labelsArray.append(temp)
        }
        let instructionTitle = UILabel()
        instructionTitle.text = "Instruction:"
        labelsArray.append(instructionTitle)
        
        let instruction = UILabel()
        instruction.numberOfLines = 0
        instruction.lineBreakMode = NSLineBreakMode.byWordWrapping
        instruction.sizeToFit()
        instruction.text = (recipe?.instruction)!
        labelsArray.append(instruction)
        
        let stackView = UIStackView(arrangedSubviews: labelsArray)
        stackView.axis = .vertical
        stackView.distribution = .fillProportionally
        stackView.spacing = 5
        stackView.translatesAutoresizingMaskIntoConstraints = false
        self.myView.addSubview(stackView)
        let viewsDictionary = ["stackView": stackView,
                               "photo": photoImage] as [String : Any]
        let stackViewV = NSLayoutConstraint.constraints(
            withVisualFormat: "V:|-[photo]-40-[stackView]", options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil, views: viewsDictionary)
        let stackViewH = NSLayoutConstraint.constraints(
            withVisualFormat: "H:|-10-[stackView]-10-|", //horizontal constraint 20 points from left and right side
            options: NSLayoutFormatOptions(rawValue: 0),
            metrics: nil,
            views: viewsDictionary)
        
        self.view.addConstraints(stackViewH)
        self.view.addConstraints(stackViewV)
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
