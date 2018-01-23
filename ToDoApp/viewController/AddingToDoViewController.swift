//
//  AddingToDoViewController.swift
//  ToDoApp
//
//  Created by Tomasz Hepa on 23.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class AddingToDoViewController: UIViewController {
    var name: String = ""
    var todo: Todo?
    var user: User?
    
   
    @IBOutlet weak var txtFieldTitle: UITextField!
    @IBOutlet weak var txtViewDetails: UITextView!
    @IBOutlet weak var untilDatePicker: UIDatePicker!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTouched(_ sender: Any) {
        
        self.user?.createAndAddNewToDo(ppTitle: txtFieldTitle.text!, ppDetails: txtViewDetails.text,ppUntilDate: untilDatePicker.date,ppIsDone: isDoneSwitch.isOn)
        
        UserController.saveUserArray()
        
        self.navigationController?.popViewController(animated: true)
      
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
