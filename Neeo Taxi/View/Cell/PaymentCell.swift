//
//  PaymentCell.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit

class PaymentCell: UITableViewCell {
    
    @IBOutlet weak var paymentImage: UIImageView!
    @IBOutlet weak var paymentLabel: UILabel!
    @IBOutlet weak var tickImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func loadData(image: UIImage?, text: String, index: Int, selected: Int) {
        if index == selected {
            tickImage.alpha = 1
        } else {
            tickImage.alpha = 0
        }
        paymentImage.image = image
        paymentLabel.text = text
    }
    
}
