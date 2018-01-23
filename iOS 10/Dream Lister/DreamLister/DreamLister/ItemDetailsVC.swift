//
//  ItemDetailsVC.swift
//  DreamLister
//
//  Created by Emad on 9/3/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import CoreData
class ItemDetailsVC: UIViewController , UIPickerViewDelegate , UIPickerViewDataSource , UIImagePickerControllerDelegate, UINavigationControllerDelegate{

    //MARAK: iboutlet definitions
    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var PriceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    @IBOutlet weak var thumbImage: UIImageView!
    //MARK: variables definitions
    var stores = [Store]()
    var itemToEdit: Item?
    var imagePicker: UIImagePickerController!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let topItem = self.navigationController?.navigationBar.topItem {
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        imagePicker = UIImagePickerController()
        imagePicker.delegate = self
        
        initialStores()
        
        getStores()
        
        if itemToEdit != nil {
            
            loadItemData()
        }
    }

    //MARK: Picker View Functions
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        let store = stores[row]
        
        return store.name
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return stores.count
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
    }
    
    
    func initialStores(){
        
        let store = Store(context: conext)
        store.name = "Best Buy"
        
        let store2 = Store(context: conext)
        store2.name = "Tesla Dealership"
        
        let store3 = Store(context: conext)
        store3.name = "Fry Electronics"
        
        let store4 = Store(context: conext)
        store4.name = "Target"
        
        let store5 = Store(context: conext)
        store5.name = "Amazon"
        
        let store6 = Store(context: conext)
        store6.name = "K Mart"
    }
    
    func getStores(){
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        
        do {
            self.stores = try conext.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
            
        } catch {
            let error = error as  NSError
            print(error)
        }
    }
    
    //MARK: Add new Item to CoreData
    @IBAction func savePressed(_ sender: UIButton) {
        
        var item: Item!
        
        let picture = Image(context:conext)
        
        picture.image = thumbImage.image
        
        
        
        if ( itemToEdit == nil) {
            //first time to add new item
            item = Item(context: conext)
        } else {
            //updating on existing one
            item = itemToEdit
        }
        
        item.toImage = picture
        
        if let title = titleField.text {
            item.title = title
        }
        
        if let price = PriceField.text {
            
            item.price = (price as NSString).doubleValue
        }
        
        if let details = detailsField.text {
            
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ap.saveContext()
        
        navigationController?.popViewController(animated: true)
        
    }
    

    func loadItemData() {
        
        if let item = itemToEdit {
            titleField.text = item.title
            PriceField.text = "\(item.price)"
            detailsField.text = item.details

            thumbImage.image = item.toImage?.image as? UIImage
            
            if let store = item.toStore {
                
                var index = 0
                
                repeat {
                    let s = stores[index]
                    if s.name == store.name {
                        storePicker.selectRow(index, inComponent: 0, animated: false)
                        break
                    }
                    index += 1
                } while ( index < stores.count)
            }
            
            
        }
    }
    
    
    @IBAction func deletePressed(_ sender: UIBarButtonItem) {
        
        if itemToEdit != nil {
            conext.delete(itemToEdit!)
            ap.saveContext()
            
        }
        navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func addImagePressed(_ sender: UIButton) {
        
        present(imagePicker, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let img = info[UIImagePickerControllerOriginalImage] as? UIImage {
            
            thumbImage.image = img
        }
        imagePicker.dismiss(animated: true, completion: nil)
    }
    
    
    
    

}
