//
//  TableViewController.swift
//  ToDoApp
//
//  Created by Tomasz Hepa on 19.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    @IBOutlet weak var infoButton: UIBarButtonItem!
    var users: [String] = []
    var newUser: String = ""
    var userController = UserController.self
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tempImageView = UIImageView(image: UIImage(named: "background"))
        tempImageView.frame = self.tableView.frame
        self.tableView.backgroundView = tempImageView;
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = true
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        
        UserController.loadUserArray();
        
        tableView.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // some coment
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return UserController.userArray.count
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MyFirstCell", for: indexPath) as UITableViewCell
        
        let user:User = UserController.userArray[indexPath.row]
        cell.textLabel?.text = user.name
        cell.backgroundColor = UIColor.clear
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user:User = UserController.userArray[indexPath.row]
        if let loginVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "LoginVC") as? AddingUserViewController {
            loginVC.user = user
            self.navigationController?.pushViewController(loginVC, animated: true)  // use the story board id UserDetailVC
            
            
            //viewController.sayHello()
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("Deleted")
            
          //  self.userController.userArray.remove(at: indexPath.row)
            self.userController.removeUser(atIndex: indexPath.row)
            self.tableView.deleteRows(at: [indexPath], with: .automatic)
        }
    }
  
}
    //override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    //{
        //}
    
    
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



