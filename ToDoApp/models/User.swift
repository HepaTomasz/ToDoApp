//
//  UserModel.swift
//  ToDoApp
//
//  Created by Tomasz Hepa on 22.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class User: NSObject, NSCoding {
    var name : String
    var password : String
    var todoArray :Array<Todo> = []
    
    
    // CONSTRUCTORE
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        password = aDecoder.decodeObject(forKey: "password") as! String
        
        if aDecoder.containsValue(forKey: "todoArray") {
            todoArray = aDecoder.decodeObject(forKey: "todoArray") as! Array<Todo>
        }
        
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(password, forKey: "password")
        aCoder.encode(todoArray, forKey: "todoArray")
    }
    
    init( name:String, password:String)
    {
        self.name = name
        self.password = password
    }
    
    func createAndAddNewToDo(ppTitle:String, ppDetails:String, ppUntilDate:Date, ppIsDone:Bool) -> Todo
    {
        // create new Todo
        let todo = Todo.init(pTitle:ppTitle, pDetails:ppDetails, pUntilDate:ppUntilDate, pIsDone:ppIsDone)
        
       // add new Todo
       todoArray.append(todo)
        
      
        
       return todo
    }
    
    func  removeTodo (atIndex:Int) {
        todoArray.remove(at: atIndex)
        UserController.saveUserArray()
   
    }
}
