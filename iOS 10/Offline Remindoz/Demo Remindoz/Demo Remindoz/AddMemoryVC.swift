//
//  AddMemoryVC.swift
//  Demo Remindoz
//
//  Created by Emad on 9/7/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import CoreData

class AddMemoryVC: UIViewController,UITextFieldDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate {

    //MARK: outlets
    @IBOutlet weak var tagField: UITextField!
    @IBOutlet weak var addImage: UIButton!
    @IBOutlet weak var memoryThumb: UIImageView!
    
    //MARK: variables
    var currentCategory:Category?
    var imagePicker: UIImagePickerController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tagField.delegate = self
        
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
 
        
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        tagField.resignFirstResponder()
        return false
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
    
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            memoryThumb.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    @IBAction func onAddImagePressed(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
    }
    
    @IBAction func onSavePressed(_ sender: UIBarButtonItem) {
        let memory:Memory = Memory(context: context)
        
        memory.memory_description = tagField.text
        memory.toCategory = currentCategory
        memory.memory_image = memoryThumb.image
        
        ap.saveContext()
        
        navigationController?.popViewController(animated: true)
    }


}
