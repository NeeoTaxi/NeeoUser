//
//  OrderVC.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit

class OrderVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func orderBtn(_ sender: Any)
    {
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }

}
