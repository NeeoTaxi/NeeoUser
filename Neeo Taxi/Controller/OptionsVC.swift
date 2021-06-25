//
//  OptionsVC.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit

class OptionsVC: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        setGradientBackground()
    }

    @IBAction func signInBtn(_ sender: Any)
    {
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    
    @IBAction func signUpBtn(_ sender: Any)
    {
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
}
