//
//  VerificationVC.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit
import Cosmos

class RatingVC: BaseVC {

    @IBOutlet weak var titleLab: UILabel!
    @IBOutlet weak var subTitleLab: UILabel!
    @IBOutlet weak var dp: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var carLabel: UILabel!
    @IBOutlet weak var neeoLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    @IBOutlet weak var distanceLabel: UILabel!
    
    @IBOutlet weak var ratingView: CosmosView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.bgIm.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
    }
    
    @IBAction func skipBtn(_ sender: Any)
    {
        
    }
    
    @IBAction func giveFeedBackBtn(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func cancelBtn(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }

}
