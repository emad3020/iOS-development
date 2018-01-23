//
//  MainVC.swift
//  Demo Remindoz
//
//  Created by Emad on 9/5/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import CoreData
class MainVC: UIViewController , UITableViewDelegate , UITableViewDataSource,NSFetchedResultsControllerDelegate{

    @IBOutlet weak var tableView: UITableView!
    var controller : NSFetchedResultsController<Category>!
    
    var currentUser : User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         
        tableView.delegate = self
        tableView.dataSource = self
        
         getUserCategories()
    }
 
    
    
    //MARK: TableView Functions
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if let sections = controller.sections {
           
            return sections.count
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if let sections = controller.sections {
         let sectionInfo = sections[section]
            return sectionInfo.numberOfObjects
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)as! CategoryCell
        configureCategoryCell(cell: cell, indexPath: indexPath as NSIndexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let itemCategory = controller.object(at: indexPath as IndexPath)
        performSegue(withIdentifier: "CategoryDetailsVC", sender: itemCategory)
        
    }
    
    //set up category cell with info from data core
    
    func configureCategoryCell(cell : CategoryCell , indexPath: NSIndexPath){
        
        let item = controller.object(at: indexPath as IndexPath)
        cell.configureCell(cell: item)
    }
    
    
    func controllerWillChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.beginUpdates()
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        
        tableView.endUpdates()
    }

    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        
        switch type {
        case.insert:
            
            if let indexPath = newIndexPath {
                
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        case.delete:
            
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            break
        case.update:
            
            if let indexPath = indexPath {
                let cell = tableView.cellForRow(at: indexPath) as! CategoryCell
                configureCategoryCell(cell: cell, indexPath: indexPath as NSIndexPath)
                
            }
            break
        case.move:
            
            if let indexPath = indexPath {
                tableView.deleteRows(at: [indexPath], with: .fade)
            }
            if let indexPath = newIndexPath {
                tableView.insertRows(at: [indexPath], with: .fade)
            }
            break
        }
        
    }

    @IBAction func onAddCatPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "NewCatVC", sender: currentUser)
    }
    
    //MARK: do segue and passing data
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "NewCatVC" {
            if let destination  = segue.destination as? NewCatVC {
                if let user = sender as? User {
                    destination.currentUser = user
                }
            }
        } else if segue.identifier == "CategoryDetailsVC" {
            if let destination = segue.destination as? CategoryDetailsVC {
                if let category = sender as? Category {
                    destination.currentCategory = category
                }
            }
        }
    }
    func getUserCategories(){
        let fetchRequest: NSFetchRequest<Category> = Category.fetchRequest()
        let nameSort = NSSortDescriptor(key: "category_name", ascending: false)
        fetchRequest.sortDescriptors = [nameSort]
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        controller.delegate = self
        
        do {
            try controller.performFetch()
        } catch {
            let error = error as NSError
            print("\(error)")
        }
        
    }

}


