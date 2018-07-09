//
//  TableViewCellShow.swift
//  HitApiSimple
//
//  Created by Mansi Mahajan on 6/25/18.
//  Copyright © 2018 Mansi Mahajan. All rights reserved.
//

import UIKit

class TableViewCellShow: UITableViewCell {

    @IBOutlet weak var label1: UILabel!
    @IBOutlet weak var label2: UILabel!
    @IBOutlet weak var label3: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setValueOfLabels (value1: String, value2: String, value3: String) {
        label1.text = value1
        label2.text = value2
        label3.text = value3
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
