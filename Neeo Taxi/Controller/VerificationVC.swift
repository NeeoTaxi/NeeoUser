//
//  VerificationVC.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit
import OTPFieldView

class VerificationVC: BaseVC {

    //MARK: OTPField Outlets
    @IBOutlet weak var otpField: OTPFieldView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpView()
        // Do any additional setup after loading the view.
    }
    
    func setUpView() {
        self.otpField.fieldsCount = 4
        self.otpField.fieldBorderWidth = 1
        self.otpField.defaultBorderColor = UIColor(red: 0.89, green: 0.89, blue: 0.89, alpha: 1.00).withAlphaComponent(0.6)
        self.otpField.filledBorderColor = AppColor.appPrimaryColor
        self.otpField.cursorColor = AppColor.appPrimaryColor
        self.otpField.displayType = .roundedCorner
        self.otpField.fieldSize = 62
        self.otpField.cornerRadius = 30
        self.otpField.defaultBackgroundColor = .white
        self.otpField.filledBackgroundColor = .white
        self.otpField.separatorSpace = 8
        self.otpField.shouldAllowIntermediateEditing = false
        self.otpField.delegate = self
        self.otpField.initializeUI()
    }
    
    @IBAction func vierifyBtn(_ sender: Any)
    {
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }

    
    @IBAction func resentBtn(_ sender: Any)
    {
        
    }
}
extension VerificationVC: OTPFieldViewDelegate {
    func shouldBecomeFirstResponderForOTP(otpTextFieldIndex index: Int) -> Bool {
        return true
    }
    
    func enteredOTP(otp: String)
    {
        //otpText = otp
    }
    
    func hasEnteredAllOTP(hasEnteredAll: Bool) -> Bool {
        return false
    }
}
