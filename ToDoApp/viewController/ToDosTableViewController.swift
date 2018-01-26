//
//  ToDosTableViewController.swift
//  ToDoApp
//
//  Created by Tomasz Hepa on 22.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class ToDosTableViewController: UITableViewController {
    var user : User?
   
    @IBOutlet weak var imgViewStatus: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.rowHeight = 161
        
        let tempImageView = UIImageView(image: UIImage(named: "background"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView;

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        self.tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat
    {
        return 161.0
    }
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return  (user?.todoArray.count)!
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SecondCell", for: indexPath) as! ToDoTableViewCell
    
        // Configure the cell...
        
        let todo = user?.todoArray[indexPath.row]
        
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.short
        let dateString = formatter.string(from: (todo?.mUntilDate)!)
       
        if (todo?.mImageData) != nil {
             cell.myImage.image = UIImage(data:(todo?.mImageData)!)
        }
        
        
        cell.titleLabel.text = todo?.mTitle
        cell.dataLabel.text = dateString
        if (todo?.mIsDone != nil)
        {
            cell.isDoneSwitch.isOn = (todo?.mIsDone)!
        }
        cell.describeTxtView.text = todo?.mDetails
        cell.backgroundColor = UIColor.clear
        
        
        if todo?.mIsDone == true {
            cell.imgViewStatus.image = #imageLiteral(resourceName: "done2")
            
        }
        else {
            cell.imgViewStatus.image = #imageLiteral(resourceName: "notDone")
        }
        
        
        
        
        return cell
    }
    
    @IBAction func onBtnAddTouched(_ sender: Any) {
        if let addToDoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addToDoVC") as? AddingToDoViewController {
            
            addToDoVC.user = user
            
            self.navigationController?.pushViewController(addToDoVC, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let todo:Todo = (user?.todoArray[indexPath.row])!
        
        if let addToDoVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "addToDoVC") as? AddingToDoViewController {
            addToDoVC.todo = todo
            addToDoVC.shouldHideIsDoneButton = false
            self.navigationController?.pushViewController(addToDoVC, animated: true)
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
            self.user?.removeTodo(atIndex: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
            }
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

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
