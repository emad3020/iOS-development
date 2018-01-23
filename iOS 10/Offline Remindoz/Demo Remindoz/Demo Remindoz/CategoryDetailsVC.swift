//
//  CategoryDetailsVC.swift
//  Demo Remindoz
//
//  Created by Emad on 9/7/17.
//  Copyright © 2017 askerlap. All rights reserved.
//

import UIKit
import CoreData

class CategoryDetailsVC: UIViewController ,UITableViewDelegate , UITableViewDataSource , NSFetchedResultsControllerDelegate{

    //MARK: outlets
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    var controller : NSFetchedResultsController<Memory>!
    var currentCategory:Category?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self

        getMemories()
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemoryItem", for: indexPath) as! MemoryItemCell
        updateCell(cell: cell, indexPath: indexPath as NSIndexPath)
        
        return cell
    }
    
    func updateCell(cell:MemoryItemCell , indexPath:NSIndexPath){
        let item = controller.object(at: indexPath as IndexPath)
        cell.configMemoryUI(cell: item)
    }
    
    @IBAction func onAddMemoryPressed(_ sender: UIBarButtonItem) {
        performSegue(withIdentifier: "AddMemoryVC", sender: currentCategory)
    }

    //MARK: do segue and passing data
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "AddMemoryVC" {
            if let destination = segue.destination as? AddMemoryVC {
                if let mCategory = sender as? Category {
                    destination.currentCategory = mCategory
                }
            }
        }
    }
    
    func getMemories(){
        let fetchRequest : NSFetchRequest<Memory> = Memory.fetchRequest()
        let userSort :NSSortDescriptor = NSSortDescriptor(key: "toCategory", ascending: false)
        fetchRequest.sortDescriptors = [userSort]
        
        let controller = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        self.controller = controller
        controller.delegate = self
        
        do {
            try controller.performFetch()
        } catch{
            let error = error as NSError
            print("\(error)")
            
        }
        
    }
    

}
