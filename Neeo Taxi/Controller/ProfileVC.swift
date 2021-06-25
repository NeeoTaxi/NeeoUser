//
//  VerificationVC.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//

import UIKit
import TOCropViewController

class ProfileVC: BaseVC {
    
    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var packagesLabel: UILabel!
    @IBOutlet weak var balanceLabel: UILabel!
    @IBOutlet weak var bonusesLabel: UILabel!
    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var numberField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    private var croppingStyle = TOCropViewCroppingStyle.circular
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.bgIm.contentMode = .scaleAspectFit
        // Do any additional setup after loading the view.
    }
    
    @IBAction func editNameBtn(_ sender: Any)
    {
        
    }
    
    @IBAction func editPhoneBtn(_ sender: Any)
    {
        
    }
    
    @IBAction func addEmailBtn(_ sender: Any)
    {
        
    }
    
    @IBAction func editPassBtn(_ sender: Any)
    {
        
    }
    
    @IBAction func forgotBtn(_ sender: Any)
    {
        
    }
    
    @IBAction func editProfilePic(_ sender: Any)
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
    
    @IBAction func logOutBtn(_ sender: Any)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondVC = storyboard.instantiateViewController(withIdentifier: "FirstVC") as? FirstVC
        {
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }

}
extension ProfileVC: UIImagePickerControllerDelegate,UINavigationControllerDelegate,TOCropViewControllerDelegate
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
