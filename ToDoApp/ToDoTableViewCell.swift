//
//  ToDoTableViewCell.swift
//  ToDoApp
//
//  Created by Tomasz Hepa on 22.01.18.
//  Copyright © 2018 Tomasz Hepa. All rights reserved.
//

import UIKit

class ToDoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var myImage: UIImageView!
    @IBOutlet weak var describeTxtView: UITextView!
    @IBOutlet weak var isDoneSwitch: UISwitch!
    @IBOutlet weak var dataLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
