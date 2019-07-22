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
    var shouldHideIsDoneButton: Bool = true;
    var pickedImage:UIImage?

   
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var labelFinished: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var txtFieldTitle: UITextField!
    @IBOutlet weak var txtViewDetails: UITextView!
    @IBOutlet weak var untilDatePicker: UIDatePicker!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        isDoneSwitch.isHidden = shouldHideIsDoneButton
        
        if (isDoneSwitch.isHidden == false)
        {
           // that means the user want to edit an existing todo
            labelFinished.isHidden = false
            txtFieldTitle.text = todo?.mTitle
            txtViewDetails.text = todo?.mDetails
            if (todo?.mIsDone != nil) {
                isDoneSwitch.isOn = (todo?.mIsDone)!
                
            }
            untilDatePicker.date = (todo?.mUntilDate)!
            
            if (todo?.mImageData != nil) {
            imgView.image = UIImage(data:(todo?.mImageData)!)
            }
        }
 
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveButtonTouched(_ sender: Any) {
        
        if (isDoneSwitch.isHidden == true)
        {
            // that means the user wants to create a new one todo
            self.user?.createAndAddNewToDo(ppTitle: txtFieldTitle.text, ppDetails: txtViewDetails.text,ppUntilDate: untilDatePicker.date,ppIsDone: isDoneSwitch.isOn, ppImage: imgView.image)
           
        }
        else{
            // that means the user want to edit an existing todo
            
            todo?.mTitle = txtFieldTitle.text!
            todo?.mDetails = txtViewDetails.text!
            todo?.mIsDone = isDoneSwitch.isOn
            todo?.mUntilDate = untilDatePicker.date
            todo?.mImageData = imgView.image?.pngData()
          

            
        }
        
        UserController.saveUserArray()
        
        self.navigationController?.popViewController(animated: true)
      
    }
    
    @IBAction func cancelButtonTouched(_ sender: Any) {
        dismiss(animated: true, completion: nil)

    }
    @IBAction func chooseImageButtonTouched(_ sender: Any) {
        let imagePickerController = UIImagePickerController()
        imagePickerController.sourceType = .photoLibrary
        imagePickerController.delegate = self as UIImagePickerControllerDelegate & UINavigationControllerDelegate
        self.present(imagePickerController, animated: true, completion: nil)
    }
}

extension AddingToDoViewController: UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
// Local variable inserted by Swift 4.2 migrator.
let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as? UIImage
        let path = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.mediaURL)] as? String
        self.pickedImage = image
        imgView.image = image
        picker.dismiss(animated: true, completion: nil)

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    }
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
