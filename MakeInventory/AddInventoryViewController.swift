//
//  AddInventoryViewController.swift
//  MakeInventory
//
//  Created by Eliel A. Gordon on 11/12/17.
//  Copyright © 2017 Eliel Gordon. All rights reserved.
//

import UIKit
import CoreData

class AddInventoryViewController: UIViewController {
    let coreDataStack = CoreDataStack.instance
    
    @IBOutlet weak var inventoryNameField: UITextField!
    @IBOutlet weak var inventoryQuantityField: UITextField!
    @IBOutlet weak var inventoryDateField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func savePressed(_ sender: Any) {
        guard let name = inventoryNameField.text, let quantity = Int64(inventoryQuantityField.text!),
        let date = inventoryDateField.text
        else {return}
        
        let inv = Inventory(context: coreDataStack.privateContext)
        
        inv.name = name
        inv.quantity = quantity
        inv.date = date
        
//        func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            if segue.identifier == "edit" {
//                let fetch = NSFetchRequest<Inventory>(entityName: "Inventory")
//                do {
//                    let result = try coreDataStack.viewContext.fetch(fetch)
//                    inv.name = name
//                    inv.quantity = quantity
//                    inv.date = date
//                    coreDataStack.saveTo(context: coreDataStack.privateContext)
//
//                    self.navigationController?.popViewController(animated: true)
//
//                } catch let error {
//                    print(error)
//                }
//            } else {
//                inv.name = name
//                inv.quantity = quantity
//                inv.date = date
//
//                coreDataStack.saveTo(context: coreDataStack.privateContext)
//
//                self.navigationController?.popViewController(animated: true)
//            }
//        }
//
        
        coreDataStack.saveTo(context: coreDataStack.privateContext)

        self.navigationController?.popViewController(animated: true)
    }
    
    
    
}
