//
//  PayOffTableViewCell.swift
//  TaskTableViewApp01
//
//  Created by 福島悠樹 on 2020/06/07.
//  Copyright © 2020 福島悠樹. All rights reserved.
//

import UIKit

class PayOffTableViewCell: UITableViewCell {

    @IBOutlet weak var payOffImaveView: UIImageView!
    @IBOutlet weak var payOffGiftName: UILabel!
    @IBOutlet weak var payOffPrice: UILabel!
    @IBOutlet weak var eraseIconView: UIImageView!
    @IBOutlet weak var payOffGiftCounter: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
