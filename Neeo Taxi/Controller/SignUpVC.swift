//
//  SignUpVC.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit
import Planet
import TOCropViewController

class SignUpVC: BaseVC {
    
    @IBOutlet weak var codeLabel: UILabel!
    @IBOutlet weak var flagImage: UIImageView!
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var firstNameTextField: UITextField!
    @IBOutlet weak var lastNameTextField: UITextField!
    @IBOutlet weak var mobileTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var confirmPassTextField: UITextField!
    private var croppingStyle = TOCropViewCroppingStyle.circular
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func nextBtn(_ sender: Any)
    {
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: "VerificationVC") as? VerificationVC
        {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    @IBAction func signInBtn(_ sender: Any)
    {
        if let VC = self.storyboard?.instantiateViewController(withIdentifier: "LoginVC") as? LoginVC
        {
            self.navigationController?.pushViewController(VC, animated: true)
        }
    }
    
    @IBAction func editProfilePicBtn(_ sender: Any)
    {
        DispatchQueue.main.async {
            print("Image Tapped")
            
            // image source alert
            let imagePickController = UIImagePickerController()
            imagePickController.delegate = self
            
            let actionsheet = UIAlertController(title:nil,message:nil,preferredStyle:UIAlertController.Style.actionSheet)
            
            let subview = actionsheet.view.subviews.first! as UIView
            let alertContentView = subview.subviews.first! as UIView
            alertContentView.backgroundColor = UIColor.white
            alertContentView.layer.cornerRadius = 15
            
            actionsheet.addAction(UIAlertAction(title: "Camera", style: .default, handler: { (action: UIAlertAction!) in
                
                if UIImagePickerController.isSourceTypeAvailable(.camera)
                {
                    imagePickController.sourceType = .camera
                    self.present(imagePickController, animated: true, completion: nil)
                }
                else
                {
                    let alert = UIAlertController(title:"Alert", message: "Camera not available.", preferredStyle:UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title:"OK",style: UIAlertAction.Style.default, handler:nil)); self.present(alert, animated:true, completion:nil)
                }
                
                
            }))
            
            actionsheet.addAction(UIAlertAction(title: "Photo Library", style: .default, handler: { (action: UIAlertAction!) in imagePickController.sourceType = .photoLibrary
                self.present(imagePickController, animated: true, completion: nil)
            }))
            
            actionsheet.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler:nil))
            
            actionsheet.popoverPresentationController?.sourceView = self.view // works for both iPhone & iPad
            
            self.present(actionsheet, animated: true) {
                print("option menu presented")
            }
        }
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
    
}
extension SignUpVC: CountryPickerViewControllerDelegate
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
extension SignUpVC: UITextFieldDelegate
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
extension SignUpVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate,TOCropViewControllerDelegate
{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        if let image = (info[UIImagePickerController.InfoKey.originalImage] as? UIImage)
        {
            let cropViewController = TOCropViewController(croppingStyle: croppingStyle,image: image)
            cropViewController.delegate = self
            cropViewController.aspectRatioPreset = .presetSquare; //Set the initial aspect ratio as a square
            cropViewController.aspectRatioLockEnabled = true // The crop box is locked to the aspect ratio and can't be resized away from it
            cropViewController.resetAspectRatioEnabled = false // When tapping 'reset', the aspect ratio will NOT be reset back to default
            cropViewController.aspectRatioPickerButtonHidden = true
            
            if croppingStyle == .circular {
                if picker.sourceType == .camera {
                    picker.dismiss(animated: true, completion: {
                        self.present(cropViewController, animated: true, completion: nil)
                    })
                } else {
                    picker.pushViewController(cropViewController, animated: true)
                }
            }
            else { //otherwise dismiss, and then present from the main controller
                picker.dismiss(animated: true, completion: {
                    self.present(cropViewController, animated: true, completion: nil)
                    //self.navigationController!.pushViewController(cropController, animated: true)
                })
            }
        }
        else
        {
            Utilities.showALertWithTag(title: "Alert", message: "Something wrong with the camera!")
        }
        
        
    }
    
    
    //dismiss source picker
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        
        picker.dismiss(animated: true, completion: nil)
        
    }
    
    func cropViewController(_ cropViewController: TOCropViewController, didCropTo image: UIImage, with cropRect: CGRect, angle: Int)
    {
        // 'image' is the newly cropped version of the original image
        
        updateImageViewWithImage(image, fromCropViewController: cropViewController)
        
    }
    
    func cropViewController(_ cropViewController: TOCropViewController, didCropToCircularImage image: UIImage, with cropRect: CGRect, angle: Int) {
        
        updateImageViewWithImage(image, fromCropViewController: cropViewController)
    }
    
    public func updateImageViewWithImage(_ image: UIImage, fromCropViewController cropViewController: TOCropViewController)
    {
        self.profilePic.image = image
        self.profilePic.makeRoundedView()
        cropViewController.dismiss(animated: true, completion: nil)
    }
}
