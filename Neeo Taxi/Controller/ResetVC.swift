//
//  VerificationVC.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit

class ResetVC: BaseVC {

    @IBOutlet weak var currentPassField: UITextField!
    @IBOutlet weak var newPassField: UITextField!
    @IBOutlet weak var repeatPassField: UITextField!
    
    @IBOutlet weak var currentPassEye: UIButton!
    @IBOutlet weak var newPassEye: UIButton!
    @IBOutlet weak var repeatPassEye: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.bgIm.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
    }
    
    @IBAction func changeBtn(_ sender: Any)
    {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func eye1Btn(_ sender: Any)
    {
    }
    
    @IBAction func eye2Btn(_ sender: Any)
    {
    }
    
    @IBAction func eye3Btn(_ sender: Any)
    {
    }

}
