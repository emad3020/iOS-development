//
//  NewCatVC.swift
//  Demo Remindoz
//
//  Created by Emad on 9/5/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit

class NewCatVC: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource ,UITextFieldDelegate{

    @IBOutlet weak var categoryNameField: UITextField!
    @IBOutlet weak var categoryPicker: UIPickerView!
    
    //MARK: Identifiers
    var categories = [String]()
    var currentUser:User?
    
    enum categoriesEnm:String {
        case BIRTHDAY,STUDY,DEATH,GRADUATION ,FAMILY ,FRIENDS
        func getCategory() ->String{
            switch self {
            case .BIRTHDAY:
                return "Birthday"
            case .DEATH:
                return "Death"
            case .STUDY:
                return "Study"
            case .GRADUATION:
                return "Graduation"
            case .FAMILY:
                return "Family"
            case .FRIENDS:
                return "Friends"
            }
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        categories.append("Birthday")
        categories.append("Study")
        categories.append("Death")
        categories.append("Graduation")
        categories.append("Family")
        categories.append("Friends")
        
        categoryPicker.dataSource = self
        categoryPicker.delegate = self
        
        categoryNameField.delegate = self
        
    }

    //MARK: TextField delegate methods
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        self.categoryNameField.resignFirstResponder()
        return false
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {

        return categories[row]
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
       return categories.count
    }
    
    
    
    @IBAction func onSavepressed(_ sender: UIButton) {
        
        let category = Category(context: context)
        
        category.toUser = currentUser
        
        if let name = categoryNameField.text {
            category.category_name = name
        }
        let item_category = categories[categoryPicker.selectedRow(inComponent: 0)]
        
        if item_category == categoriesEnm.BIRTHDAY.getCategory() {
            category.category_icon = UIImage(named: "birthday_ic")
        } else if item_category == categoriesEnm.STUDY.getCategory() {
            category.category_icon = UIImage(named: "study_ic")
        } else if item_category == categoriesEnm.FAMILY.getCategory() {
            category.category_icon = UIImage(named: "family_ic")
        } else if item_category == categoriesEnm.FRIENDS.getCategory() {
            category.category_icon = UIImage(named: "friends_ic")
        }
        
        ap.saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }
    
    
}
