//
//  CategoryViewController.swift
//  Todoey
//
//  Created by Jassem Al-Buloushi on 4/18/19.
//  Copyright © 2019 Jassem Al-Buloushi. All rights reserved.
//

import UIKit
import CoreData

class CategoryViewController: UITableViewController {
    //properties
    
    var categories = [Category]()
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
       loadCategories()
 
    }
    
    //MARK: - TableView Datasource Methods
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return categories.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CategoryCell", for: indexPath)
        
        cell.textLabel?.text = categories[indexPath.row].name
        
        return cell
    }
  
    
    //MARK: - Add new Categories
    
    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
       
        var textField = UITextField()
        
        let ac = UIAlertController(title: "Add New Category", message: nil, preferredStyle: .alert)
        let action = UIAlertAction(title: "Add", style: .default) { (action) in
            let newCategory = Category(context: self.context)
            
            guard let textFieldText = textField.text else { return }
            
            newCategory.name = textFieldText
            
            self.categories.append(newCategory)
            
            self.saveCategories()
            
        }
        
        ac.addTextField { (alertTextField) in
            alertTextField.placeholder = "Add new category"
            textField = alertTextField
        }
        
        ac.addAction(action)
        
        present(ac, animated: true, completion: nil)
        
    }

    
    //MARK: - Data Menipulation Methods
    
    func saveCategories() {
        do {
            try context.save()
        } catch {
            print("Error saving to context, \(error)")
        }
        
        tableView.reloadData()
    }
    
    func loadCategories(with request: NSFetchRequest<Category> = Category.fetchRequest()) {
        do {
            categories = try context.fetch(request)
        } catch {
            print("Error fetching context, \(error)")
        }
        
        tableView.reloadData()
    }
    
    
    
    
    
    //MARK: - TableView Delegate Methods
    
    
    
    
    
}
