//
//  ViewController.swift
//  Todoey
//
//  Created by Philipp Muellauer on 02/12/2019.
//  Copyright © 2019 App Brewery. All rights reserved.
//

import UIKit
import CoreData

class TodoListViewController: UITableViewController {

//    var itemStringArray = [
//        "Find Mike", "Buy Eggos", "Destroy Demogorgon",
//        "a", "b", "c", "d", "e", "f", "g", "h", "i", "j", "k", "l", "m", "n", "o", "p", "q", "r", "s", "t", "u", "v", "w", "x", "y", "z"
//    ]

    var itemArray = [Item]()
    
    var selectedCategor: Category? {
        didSet {
//            loadItems()
        }
    }
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        print(FileManager.default.urls(for: .documentDirectory, in: .userDomainMask))
        
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return itemArray.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ToDoItemCell", for: indexPath)
        let item = itemArray[indexPath.row]
        cell.textLabel?.text = item.title
        cell.accessoryType = item.done ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        itemArray[indexPath.row].done = !itemArray[indexPath.row].done
        tableView.deselectRow(at: indexPath, animated: true)
        self.saveItems()
//        itemArray[indexPath.row].setValue(true, forKey: "done")
//        context.delete(itemArray[indexPath.row])
//        itemArray.remove(at: indexPath.row)
//        self.saveItems()
    }

//    @IBAction func addButtonPressed(_ sender: UIBarButtonItem) {
//        var textField = UITextField()
//
//        let alert = UIAlertController(title: "Add New Todoey Item", message: "", preferredStyle: .alert)
//
//        let action = UIAlertAction(title: "Add Item", style: .default) { (action) in
//            let newItem = Item(context: self.context)
//            newItem.title = textField.text!
//            newItem.parentCategory = self.selectedCategor
//            self.itemArray.append(newItem)
//            textField = UITextField()
//            self.saveItems()
//        }
//
//        alert.addTextField { (alertTextField) in
//            alertTextField.placeholder = "Create New Item"
//            textField = alertTextField
//        }
//
//        alert.addAction(action)
//
//        present(alert, animated: true, completion: nil)
//    }

    func saveItems() {
        do {
            try context.save()
        } catch {
            print("Error saving context \(error)")
        }
        tableView.reloadData()
    }
    
//    func loadItems(with request: NSFetchRequest<Item> = Item.fetchRequest(), predicate: NSPredicate? = nil) {
//        let categoryPredicate = NSPredicate(format: "parentCategory.name MATCHES %@", selectedCategor!.name!)
//
//        if let additionalPredicate = predicate {
//            request.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [additionalPredicate, categoryPredicate])
//        } else {
//            request.predicate = categoryPredicate
//        }
//
//        do {
//            itemArray = try context.fetch(request)
//        } catch {
//            print("Error fetching data from context \(error)")
//        }
//        tableView.reloadData()
//    }
    
}

// MARK: UISearchBarDelegate

extension TodoListViewController: UISearchBarDelegate {
    
//    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
//        let count = searchBar.text?.count ?? 0
//        
//        if count > 0 {
//            let request: NSFetchRequest<Item> = Item.fetchRequest()
//            
//            let predicate = NSPredicate(format: "title CONTAINS[cd] %@", searchBar.text!)
//            
//            let sortDescriptor = NSSortDescriptor(key: "title", ascending: true)
//            request.sortDescriptors = [sortDescriptor]
//            
//            loadItems(with: request, predicate: predicate)
//        } else {
//            searchBar.resignFirstResponder()
//        }
//    }
//    
//    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
//        if searchBar.text?.count == 0 {
//            loadItems()
//            
//            DispatchQueue.main.async {
//                searchBar.resignFirstResponder()
//            }
//        }
//    }
}
