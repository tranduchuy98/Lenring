//
//  TableViewController.swift
//  Lenring
//
//  Created by Huy on 5/17/18.
//  Copyright © 2018 Huy. All rights reserved.
//

import UIKit
import CoreData

class TableViewController: UITableViewController , NSFetchedResultsControllerDelegate {
    
    var fetchedResultsController = Dataservice.shared.fetchedResultsController
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchedResultsController.delegate = self
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        let count = fetchedResultsController.sections![section]
        return count.numberOfObjects
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        //let array = Dataservice.shared.arr[indexPath.row]
        let array = fetchedResultsController.object(at: indexPath)
        cell.textLabel?.text = "\(array.tu!) / \(array.phienAm!) / \(array.nghia!) / \(array.vidu!) / \(array.nghiaViDu!)" ?? ""
        cell.imageView?.image = array.image as? UIImage ?? #imageLiteral(resourceName: "icon-plus")
        return cell
    }
    
    func controller(_ controller: NSFetchedResultsController<NSFetchRequestResult>, didChange anObject: Any, at indexPath: IndexPath?, for type: NSFetchedResultsChangeType, newIndexPath: IndexPath?) {
        switch type {
        case .insert:
            tableView.insertRows(at: [newIndexPath!], with: .fade)
        case .delete:
            tableView.deleteRows(at: [indexPath!], with: .fade)
        case . update:
            tableView.reloadRows(at: [indexPath!], with: .fade)
        default:
            break
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let vc = segue.destination as! DetailViewController
        if let index = tableView.indexPathForSelectedRow{
            vc.arrDetail = [fetchedResultsController.object(at: index)]
            vc.index = index
        }
        Dataservice.shared.isAvtive = true
        
    }
    
    
    
    
    /*
     // Override to support conditional editing of the table view.
     override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the specified item to be editable.
     return true
     }
     */
    
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            AppDelegate.context().delete(fetchedResultsController.object(at: indexPath))
            AppDelegate.saveContext()
            // tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
    }
    
    
    /*
     // Override to support rearranging the table view.
     override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
     
     }
     */
    
    /*
     // Override to support conditional rearranging of the table view.
     override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
     // Return false if you do not want the item to be re-orderable.
     return true
     }
     */
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     }
     */
    
}
