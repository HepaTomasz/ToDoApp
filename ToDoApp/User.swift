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
    
    
    // CONSTRUCTORE
    
    required init(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "name") as! String
        password = aDecoder.decodeObject(forKey: "password") as! String
    }

    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "name")
        aCoder.encode(password, forKey: "password")
    }
    
    init( name:String, password:String)
    {
        self.name = name
        self.password = password
    }
    

   


}
