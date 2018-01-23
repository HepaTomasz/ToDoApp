//
//  todo.swift
//  ToDoApp
//
//  Created by Tomasz Hepa on 23.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class Todo: NSObject, NSCoding {
    var mTitle : String
    var mDetails : String
    var mUntilDate : Date
    var mIsDone : Bool = false
    
    
    required init(coder aDecoder: NSCoder) {
        mTitle = aDecoder.decodeObject(forKey: "title") as! String
        mDetails = aDecoder.decodeObject(forKey: "details") as! String
        mUntilDate = aDecoder.decodeObject(forKey: "untilDate") as! Date
//
//        if aDecoder.containsValue(forKey: "isDone")
//        {
//            mIsDone = aDecoder.decodeObject(forKey: "isDone") as! Bool
//        }
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(mTitle, forKey: "title")
        aCoder.encode(mDetails, forKey: "details")
        aCoder.encode(mUntilDate, forKey: "untilDate")
        aCoder.encode(mIsDone, forKey: "isDone")
    }
    
    // first initalize
    init( pTitle:String, pDetails:String, pUntilDate:Date, pIsDone:Bool )
    {
        mTitle = pTitle
        mDetails = pDetails
        mUntilDate = pUntilDate
        mIsDone = pIsDone

    }
}
