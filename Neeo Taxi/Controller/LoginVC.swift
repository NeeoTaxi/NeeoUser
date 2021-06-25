//
//  LoginVC.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit
import ActionSheetPicker_3_0
import Planet

class LoginVC: BaseVC {

    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var languageTextField: UITextField!
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var languageImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.bgIm.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
    }
    
    @IBAction func signInBtn(_ sender: Any)
    {
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: "HomeVC") as? HomeVC
        {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    @IBAction func forgotBtn(_ sender: Any)
    {
        
    }
    
    @IBAction func codeBtn(_ sender: Any)
    {
        let viewController = CountryPickerViewController()
        viewController.delegate = self
        
        print("The current country is \(String(describing: viewController.currentCountry))")
        
        // Try out showning a custom list of country codes by uncommenting the following line:
        // viewController.countryCodes = ["US", "IN"]
        
        // Use Country like this:
        if let country = Country.find(isoCode: "TR", locale: Locale(identifier: "tr_TR")) {
            print("I found \(country.name)!")
            // => Planet.Country(name: "Türkiye", isoCode: "TR", callingCode: "+90")
        }
        
        let navigationController = UINavigationController(rootViewController: viewController)
        present(navigationController, animated: true, completion: nil)
        
    }
    
    @IBAction func languageBtn(_ sender: Any)
    {
        let languageArr = ["Russian"]
        ActionSheetStringPicker.show(withTitle: "Select Language",
                                     rows: languageArr,
                                     initialSelection: 0,
                                     doneBlock: { picker, value, index in
                                        self.languageTextField.text = languageArr[value]
                                        return
                                     },
                                     cancel: { picker in
                                        return
                                     },
                                     origin: sender)
    }

    @IBAction func signUpBtn(_ sender: Any)
    {
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: "SignUpVC") as? SignUpVC
        {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
}
extension LoginVC: CountryPickerViewControllerDelegate
{
    func countryPickerViewControllerDidCancel(_ countryPickerViewController: CountryPickerViewController) {
        print("countryPickerViewControllerDidCancel: \(countryPickerViewController)")
        
        dismiss(animated: true, completion: nil)
    }
    
    func countryPickerViewController(_ countryPickerViewController: CountryPickerViewController, didSelectCountry country: Country) {
        print("countryPickerViewController: \(countryPickerViewController) didSelectCountry: \(country)")
        
        
        self.codeLabel.text = "\(country.isoCode) \(country.callingCode)"
        self.flagImage.image = country.image
        dismiss(animated: true, completion: nil)
    }
}
extension LoginVC: UITextFieldDelegate
{
    //Move control to next textfield
    func textFieldShouldReturn(_ textField: UITextField) -> Bool
    {
        if IQKeyboardManager.shared.canGoNext {
            IQKeyboardManager.shared.goNext()
        } else {
            textField.resignFirstResponder()
        }
        
        return true
    }
}
