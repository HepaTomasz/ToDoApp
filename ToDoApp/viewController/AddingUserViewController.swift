//
//  AddingUserViewController.swift
//  ToDoApp
//
//  Created by Tomasz Hepa on 22.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class AddingUserViewController: UIViewController {
    var name: String = ""
    
    @IBOutlet weak var labelWrongPassword: UILabel!
    @IBOutlet weak var NameField: UITextField!
    @IBOutlet weak var txtFieldPassword: UITextField!
    @IBOutlet weak var txtFieldTypePassword: UITextField!
    
    var user : User?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        //if {
            
            
    //labelWrongPassword != nil;)
      //  labelWrongPassword.isHidden = true
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBAction func SaveName(_ sender: Any) {
        
        let user = UserController.createAndAddNewUser(name: NameField.text!, password: txtFieldPassword.text! )
        
        dismiss(animated: true, completion: nil)
    }
    @IBAction func loginButtonTouched(_ sender: Any) {
    
    var userPassword = user?.password
       if txtFieldTypePassword.text == user?.password {
        
            if let toDosTableViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ToDosTableViewController") as? ToDosTableViewController {
                
                toDosTableViewController.user = user
                
                self.navigationController?.pushViewController(toDosTableViewController, animated: true)
            }
        
       }
       else
       {
            labelWrongPassword.isHidden = false
       }
        
        // validate password given by textfield with password from user object
        
        // if right, than push to the next view controller and hand over the user object
        
    }
    @IBAction func cancelButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */


}
