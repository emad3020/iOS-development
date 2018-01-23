//
//  ViewController.swift
//  Book Tracker
//
//  Created by Emad on 6/22/17.
//  Copyright © 2017 askerlapAskerlap. All rights reserved.
//

import UIKit

class ViewController: UIViewController , UITextFieldDelegate , UIImagePickerControllerDelegate , UINavigationControllerDelegate{

    @IBOutlet weak var bookNameLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var photoImageView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.delegate = self
        photoImageView.isUserInteractionEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
         nameTextField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        bookNameLabel.text = textField.text
    }
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        //dismiss the picker
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let selectedImage = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        photoImageView.image = selectedImage
        
        //dismiss the picker 
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func selectImageLibrary(_ sender: UITapGestureRecognizer) {
        
        nameTextField.resignFirstResponder()
        
        let imagePickerController = UIImagePickerController()
        //Only allow photos to be picked , not taken
        imagePickerController.sourceType = .photoLibrary
        
        imagePickerController.delegate = self
        
        present(imagePickerController, animated: true, completion: nil)
    
    }
    
    @IBAction func setDefaultText(_ sender: UIButton) {
        
        bookNameLabel.text = "Default Book"
    }

}

