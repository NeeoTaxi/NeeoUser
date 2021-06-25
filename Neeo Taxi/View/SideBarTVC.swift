//
//  NutrientsTVC.swift
//  komodo-app
//
//  Created by Fuad Waheed on 10/05/2019.
//  Copyright © 2019 esource42. All rights reserved.
//

import UIKit

class SideBarTVC: UITableViewCell {
    
    @IBOutlet weak var imageV: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func loadData(text:String,img:UIImage?)
    {
        self.imageV.image = img
        self.nameLabel.text = text
    }
    
}
