//
//  UserController.swift
//  ToDoApp
//
//  Created by Tomasz Hepa on 22.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class UserController: NSObject {

    static var userArray:Array<User> = []
    var todoArray :Array<Todo> = []
    class func createAndAddNewUser(name:String, password:String) -> User
    {
        // create new User
        let user = User.init(name:name, password:password)
        
        // add new user
        UserController.addUser(newUser:user)
        
        return user
    }
    
    class func addUser( newUser:User) {
        UserController.userArray.append(newUser)
        UserController.saveUserArray();
    }
        
    class func  removeUser (atIndex:Int) {
        UserController.userArray.remove(at: atIndex)
        UserController.saveUserArray();
        
    }
    
    
    class func saveUserArray()
    {
        let ud = UserDefaults.standard
   
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: UserController.userArray)
        ud.set(encodedData, forKey: "UserArray")
        ud.synchronize()
    }
    
    class func loadUserArray()
    {
        let ud = UserDefaults.standard
        var decoded:Data?
        decoded = ud.object(forKey: "UserArray") as? Data
        
        if decoded != nil
        {
            let decodedUserArr = NSKeyedUnarchiver.unarchiveObject(with: decoded!) as! [User]
            
            UserController.userArray = decodedUserArr
        }
    }
    
}

