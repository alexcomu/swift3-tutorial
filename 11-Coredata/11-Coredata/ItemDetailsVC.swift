//
//  ItemDetailsVC.swift
//  11-Coredata
//
//  Created by Alex Comunian on 18/01/17.
//  Copyright © 2017 Alex Comunian. All rights reserved.
//

import UIKit
import CoreData


class ItemDetailsVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource{

    @IBOutlet weak var storePicker: UIPickerView!
    @IBOutlet weak var titleField: CustomTextField!
    @IBOutlet weak var priceField: CustomTextField!
    @IBOutlet weak var detailsField: CustomTextField!
    
    var stores = [Store]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let topItem = self.navigationController?.navigationBar.topItem{
            topItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItemStyle.plain, target: nil, action: nil)
        }
        
        storePicker.delegate = self
        storePicker.dataSource = self
        
        //generateStores()
        getStore()
    }
    
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
        // Update at click
    }
    
    func getStore(){
        
        let fetchRequest: NSFetchRequest<Store> = Store.fetchRequest()
        do{
            self.stores = try context.fetch(fetchRequest)
            self.storePicker.reloadAllComponents()
            
        }catch{
            // handle error
            
        }
    }
    
    func generateStores(){
        let store = Store(context: context)
        store.name = "Comu Enterprise"
        
        let store2 = Store(context: context)
        store2.name = "Comu Logic"
        
        let store3 = Store(context: context)
        store3.name = "Comu Shop"
        
        let store4 = Store(context: context)
        store4.name = "Comu Electronics"
        
        let store5 = Store(context: context)
        store5.name = "Amazomu"
                
        ad.saveContext()
    }
    
    @IBAction func savePressed(_ sender: Any) {
        
        let item = Item(context: context)
        
        if let title = titleField.text{
            item.title = title
        }
        if let price = priceField.text{
            item.price = (price as NSString).doubleValue
        }
        if let details = detailsField.text{
            item.details = details
        }
        
        item.toStore = stores[storePicker.selectedRow(inComponent: 0)]
        
        ad.saveContext()
        
        _ = navigationController?.popViewController(animated: true)
        
    }
    
    
    
    

}
