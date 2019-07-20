//
//  todo.swift
//  ToDoApp
//
//  Created by Tomasz Hepa on 23.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class Todo: NSObject, NSCoding {
    var mTitle : String?
    var mDetails : String
    var mUntilDate : Date
    var mIsDone : Bool?
    var mImageData : Data?
    
    required init(coder aDecoder: NSCoder) {
        mTitle = aDecoder.decodeObject(forKey: "title") as? String
        mDetails = aDecoder.decodeObject(forKey: "details") as! String
        mUntilDate = aDecoder.decodeObject(forKey: "untilDate") as! Date
        mImageData = aDecoder.decodeObject(forKey: "imageData") as? Data
        mIsDone = aDecoder.decodeObject(forKey: "isDone") as? Bool
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(mTitle, forKey: "title")
        aCoder.encode(mDetails, forKey: "details")
        aCoder.encode(mUntilDate, forKey: "untilDate")
        aCoder.encode(mIsDone, forKey: "isDone")
        aCoder.encode(mImageData, forKey: "imageData")
    }
    
    // first initalize
    init( pTitle:String?, pDetails:String, pUntilDate:Date, pIsDone:Bool?, pImage:UIImage?)
    {
        if let title = pTitle
        {
            mTitle = title
        }
        
        mDetails = pDetails
        mUntilDate = pUntilDate
        
        if let isDone = pIsDone {
            mIsDone = isDone
        }
        
        if let image = pImage
        {
            mImageData = image.pngData()
        }
        else
        {
            mImageData = nil
        }
    }
            
}

