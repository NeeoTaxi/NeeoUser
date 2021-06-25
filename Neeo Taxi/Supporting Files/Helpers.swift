//
//  Constants.swift
//  GameVU
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.
//


import UIKit

let appDelegate = UIApplication.shared.delegate as! AppDelegate

struct AppColor {
    
    static let appPrimaryColor =  UIColor(red: 0.14, green: 0.48, blue: 0.97, alpha: 1.00)
    static let appBackGroundColor =  UIColor(red: 0.11, green: 0.11, blue: 0.13, alpha: 1.00)
    static let appBlueColor =  UIColor(red: 0.86, green: 0.94, blue: 0.97, alpha: 1.00)
    static let appTextFieldBackGroundColor =  UIColor(red: 0.92, green: 0.95, blue: 1.00, alpha: 1.00)
    static let appGrayColor = UIColor(red: 0.67, green: 0.67, blue: 0.67, alpha: 1.00)
    
    private struct Alphas {
        static let Opaque = CGFloat(1)
        static let SemiOpaque = CGFloat(0.8)
        static let SemiTransparent = CGFloat(0.5)
        static let Transparent = CGFloat(0.3)
    }
}

struct Notifications {
    static let ClosePanel = Notification.Name("close_panel")
}

struct APPURL {
    
    private struct Domains {
        static let Dev = "https://voxmenu.com/"
        static let Live = "https://voxmenu.com/"
    }
    
    private  struct Routes {
        static let Api = "vox_apis/vox_menu/api/"
    }
    
    private  static let Domain = Domains.Live
    private  static let Route = Routes.Api
    private  static let BaseURL = Domain + Route
    
    static var Login: String {
        return BaseURL + "UserSignin"
    }
    
    static var AddOrder: String {
        return BaseURL + "AddOrder"
    }
    
    static var LogOut: String {
        return BaseURL + "UserLogout?token="
    }
    
    static var GetCategories: String {
        return BaseURL + "ViewRestaurantCategories"
    }
    
    static var GetRestaurants: String {
        return BaseURL + "ViewRestaurants?category="
    }
    
    static var GetOrders: String {
        return BaseURL + "OrderHistory?customerid="
    }
    
    static var GetOrdersByID: String {
        return BaseURL + "OrderHistory?orderid="
    }
    
    static var GetProducts: String {
        return BaseURL + "ViewProdCategory?id="
    }
    
    static var RateRestaurant: String {
        return BaseURL + "RateOrder"
    }
    
    static var GetAddresses: String {
        return BaseURL + "ViewUserAddress?token="
    }
    
    static var AddAddress: String {
        return BaseURL + "UserAddAddress"
    }
    
    static var ActiveAddress: String {
        return BaseURL + "ActiveUserAdd?id="
    }
    
    static var SendDNDData: String {
        return BaseURL + "mobile-dnd-request.php"
    }
    
    static var GetProfile: String {
        return BaseURL + "CustomerDetailByMobileNo"
    }
    
    static var AddComment: String {
        return BaseURL + "api_comment.php?book_id="
    }
    
    static var SignUp: String {
        return BaseURL + "UserSignup"
    }
    
    static var SignUpSocial: String {
        return BaseURL + "app_api_fb_twt_login.php"
    }
    
    static var UpdatePassword: String {
        return BaseURL + "UserPwdUp"
    }
    
    static var UpdateDP: String {
        return BaseURL + "ForgetPasswordForAppUpdate"
    }
    
    
    static var GetReferrals: String {
        return BaseURL + "CustomerRefferalAccount"
    }
    
    
    
    
    static var GetAccount: String {
        return BaseURL + "user_profile_api.php?id="
    }
    
    
    static var ResetPassword: String {
        return BaseURL + "password/reset"
    }
    
    static var ForgotPasswordURL: String {
        return BaseURL + "user_forgot_pass_api.php?"
    }
    
    static var FindToken: String {
        return BaseURL + "password/find"
    }
    
    static var ChangePin: String {
        return BaseURL + "ChangePasswordForApp"
    }
    
    static var UpdateProfile: String {
        return BaseURL + "UserProfileUpdate"
    }
    
    
    
    static var GetAllStores: String {
        return BaseURL + "store/list"
    }
    
    static var GetAllSavings: String {
        return BaseURL + "user/saving/details"
    }
    
    static var GetStoreDetails: String {
        return BaseURL + "store/details"
    }
    
    static var GetFavBrands: String {
        return BaseURL + "GetPersonFavouritesAll"
    }
    
    static var GetDetailPromo: String {
        return BaseURL + "GetDetailOfPromoCodes"
    }
    
    static var GetAllPromo: String {
        return BaseURL + "GetAllPromocodes"
    }
    
    static var GetDetailOffer: String {
        return BaseURL + "GetDetailOfOffers"
    }
    
    static var GetOffers: String {
        return BaseURL + "brand/offers"
    }
    
    static var SetDetailOffer: String {
        return BaseURL + "SetDetailOfOffers"
    }
    
    static var SetPersonFavourite: String {
        return BaseURL + "brand/mark-favourite"
    }
    
    static var GetAuthors: String {
        return BaseURL + "api.php?author_list"
    }
    
    static var GetCategoryByID: String {
        return BaseURL + "api.php?cat_id="
    }
    
    static var GetDownloadedBooks: String {
        return "https://familabooks.com/mob-api/old-get-book-details.php?user_id="
    }
    
    static var GetFavorites: String {
        return BaseURL + "rehman_api.php?show_my_favourites_books=1&user_id="
    }
    
    static var GetLatestBooks: String {
        return BaseURL + "api.php?latest"
    }
    
    static var AddToFavorites: String {
        return BaseURL + "rehman_api.php?add_to_favourites=1&user_id="
    }
    
    static var Ratebook: String {
        return BaseURL + "/api_rating.php?book_id="
    }
    
    static var Reportbook: String {
        return BaseURL + "api.php?book_report&user_id="
    }
    
    static var PurchaseBook: String {
        return "https://familabooks.com/mob-api/purchase-book.php"
    }
    
    static var GetBookDetails: String {
        return BaseURL + "api.php?book_id="
    }
    
    static var GetHomeItems: String {
        return BaseURL + "api.php?home"
    }
    
    
}

struct Screen {
    static func width() -> CGFloat {
        return UIScreen.main.bounds.width
    }
    
    static func height() -> CGFloat {
        return UIScreen.main.bounds.height
    }
}

struct Key {
    
    struct Messages{
        static let SuccessTitle = "Success"
        static let AlertTitle = "Hey!"
        static let WarningTitle = "Caution"
        static let ErrorTitle = "Something went wrong"
        static let termsError = "You need to agree to terms and conditions to proceed."
        
        static let LocationError = "Location is required"
        static let NameError = "Please enter your name."
        static let lNameError = "Last Name is required"
        static let fNameError = "First Name is required"
        static let EmailError = "Please enter your email."
        static let AmountError = "Amount is required"
        static let PlanError = "Plan is required"
        static let MobileError = "Please enter your mobile number."
        static let OTPError = "Something Went Wrong!Try again later."
        static let OldPinError = "Please enter new password."
        static let PinError = "Please enter new password."
        static let FirstPinError = "Please enter password."
        static let ConfirmPinError = "Please enter confirm password."
        static let SubjectError = "Please enter subject."
        static let RefferalError = "Please enter refferal code."
        static let QuantityError = "Quantity is required"
        static let MobileInvalidError = "Mobile number is invalid"
        static let MobileFormatError = "Incorrect Mobile Number format."
        static let InvalidEmailError = "Please enter a valid email."
        static let UsernameError = "Username is required"
        static let AddressError = "Address is required"
        static let PassCountError = "Please enter password with length greater than 5."
        static let PassError = "Please enter your password."
        static let oldPassError = "Please enter your old password."
        static let newPassError = "Please enter your new password."
        static let confirmPassError = "Please enter confirm password."
        static let WeightError = "Please enter a valid current weight."
        static let PassMismatchError = "Password didn't match."
        static let PinMismatchError = "Passwords do not match."
        static let PassSameError = "Current and New Password cannot be same!"
        static let PaymentError = "Select Payment Method."
        static let PhoneCodeError = "Phone Code is required"
        static let ImageError = "Profile Image is required"
        static let PasswordResetSuccess = "Password reset link sent to email."
        static let NoInternet = "Check your connection and Try Again."
        static let EmptyTextView = "Report field cannot be empty"
        
        static let CountryError = "Country Name is required"
        static let RatingError = "Kindly fill all ratings"
        static let ZipError = "Zip Code is required"
        static let CityError = "City Name is required"
        static let GenderError = "Gender is required"
        static let AgeError = "Age is required"
        static let CodeError = "Code is required"
        static let MessageError = "Message is required"
        static let PaymentMethodError = "Payment Method is required"
        static let ShippingError = "Shipping is required"
        static let DOBError = "Date of Birth is required"
        static let TitleError = "Title is required"
        static let AreaError = "Area is required"
        static let ProfessionError = "Profession is required"
        static let AnnualError = "Yearly Income is required"
        static let StateError = "State is required"
        static let DistrictError = "District Income is required"
        static let ExpiryError = "Expiry Date is required"
        
        static let DateError = "Date is required"
        static let CategoryError = "Category is required"
        static let DescError = "Description is required"
        static let TotalError = "Total Spending is required"
        
        static let WrongStateError = "Write correct State from the list."
        static let WrongDistrictError = "Write correct District from the list."
        
        static let CarTypeError = "Car Type is required"
        static let CarColorError = "Car Color is required"
        
        static let CardNameError = "Card Name is required"
        static let CardNumError = "Card Number is required"
        static let CVVError = "CVV is required"
        static let CardMonthError = "Expiry Month is required"
        static let CardYearError = "Expiry Year is required"
        
        static let LoanError = "Loan Amount is required to calculate EMI value"
        static let TenorError = "Tenor is required to calculate EMI value"
        static let InterestError = "Interest Percentage is required to calculate EMI value"
        
        
    }
    
    struct Error {
        static let ParseDomain = "Parsing Error"
        static let ParseError = "Unable to parse response."
        static let InvalidResponse = "Invalid response."
        static let Unauthorized = "You are not authorized to login to the app."
        
        //MARK:
        static let UploadOperationCancelled = "Upload operation was cancelled."
        
    }
    
}


struct Utilities {
    
    static func isValidEmail(email:String) -> Bool {
        // print("validate calendar: \(testStr)")
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailTest.evaluate(with:email)
    }
    
    static func isConnected () -> Bool {
        // print("validate calendar: \(testStr)")
        if (ConnectionCheck.isConnectedToNetwork())
        {
            return true
        }
        else
        {
            return false
        }
    }
    
    static func showALertWithTag(title:String, message:String?)
    {
        var alertController = UIAlertController()
        alertController = UIAlertController(title: title, message: message , preferredStyle: UIAlertController.Style.alert)
        
        let ok:UIAlertAction = UIAlertAction(title: "OK", style: UIAlertAction.Style.default) { (action) -> Void in
            alertController.dismiss(animated: true, completion: nil)
        }
        alertController.addAction(ok)
        let topViewController = appDelegate.window?.rootViewController
        topViewController?.present(alertController, animated: true, completion: nil)
    }
    
    // MARK: - Alert Helpers
    
    static func showError(withMessage:String) {
        let banner = Utilities.banner(title:Key.Messages.ErrorTitle, message: withMessage, bgColor: AppColor.appPrimaryColor)
        banner.show(duration: 2.0)
    }
    
    static func showWarning(withMessage:String) {
        let banner = Utilities.banner(title:Key.Messages.WarningTitle, message: withMessage, bgColor: FlatYellow())
        banner.textColor = FlatBlack()
        banner.show(duration: 2.0)
    }
    
    static func showSuccess(withMessage:String) {
        let banner = Utilities.banner(title:Key.Messages.SuccessTitle, message: withMessage, bgColor: FlatGreen())
        banner.show(duration: 2.0)
    }
    
    static func showAlert(withMessage:String) {
        let banner = Utilities.banner(title:Key.Messages.AlertTitle, message: withMessage, bgColor: FlatSkyBlue())
        banner.show(duration: 2.0)
    }
    
    static func banner(title:String, message:String, bgColor:UIColor) -> Banner {
        let banner = Banner(title: nil, subtitle: message, image: nil, backgroundColor:bgColor)
        banner.springiness = .heavy
        banner.position = .top
        banner.adjustsStatusBarStyle = true
        banner.dismissesOnSwipe = true
        banner.dismissesOnTap = true
        banner.textColor = FlatWhite()
        banner.minimumHeight = 64
        
        return banner
    }
    
    // MARK: - View Helpers
    
}


struct Cache {
    static func save(_ value:Any, forKey:String) {
        UserDefaults.standard.setValue(value, forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func saveCustomObject(_ value:User, forKey:String) {
        UserDefaults.standard.set(try? PropertyListEncoder().encode(value), forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    
    static func extractCustomObject(_ forKey:String) -> User?
    {
        
        if let data = UserDefaults.standard.value(forKey:forKey) as? Data
        {
            let savedObject = try? PropertyListDecoder().decode(User.self, from: data)
            return savedObject
            
        }
        else
        {
            return nil
        }
    }
    
    
    static func extractString(_ forKey:String) -> String? {
        let tmp = UserDefaults.standard.string(forKey: forKey)
        return tmp
    }
    
    static func extractBool(_ forKey:String) -> Bool? {
        let tmp = UserDefaults.standard.bool(forKey: forKey)
        return tmp
    }
    
    static func extractDate(_ forKey:String) -> Date? {
        let tmp = UserDefaults.standard.object(forKey: forKey) as? Date
        return tmp
    }
    
    static func extractDouble(_ forKey:String) -> Double? {
        let tmp = UserDefaults.standard.object(forKey: forKey) as? Double
        return tmp
    }
    
    static func extractInt(_ forKey:String) -> Any? {
        let tmp = UserDefaults.standard.integer(forKey: forKey)
        return tmp
    }
    
    static func remove(forKey:String) {
        UserDefaults.standard.removeObject(forKey: forKey)
        UserDefaults.standard.synchronize()
    }
    
    static func removeAll()
    {
        let dict = UserDefaults.standard.dictionaryRepresentation() as NSDictionary
        for key in dict.allKeys
        {
            if key as! String != "brainToken"
            {
                UserDefaults.standard.removeObject(forKey: key as! String)
            }
            
        }
        UserDefaults.standard.synchronize()
    }
    
    //    static func removeUserFromCache() {
    //
    //        UserDefaults.standard.removeObject(forKey: Key.Params.kUserId)
    //        UserDefaults.standard.removeObject(forKey: Key.Params.kUserAccess)
    //        UserDefaults.standard.removeObject(forKey: Key.Params.kToken)
    //        UserDefaults.standard.removeObject(forKey: Key.Params.kFName)
    //        UserDefaults.standard.removeObject(forKey: Key.Params.kLName)
    //        UserDefaults.standard.removeObject(forKey: Key.Params.kTAvatar)
    //        UserDefaults.standard.synchronize()
    //    }
    //
    //    static func saveUserToCache(user:User?) {
    //        if let uid = user?.userId,
    //            let access = user?.access,
    //            let token = user?.userAuthToken,
    //            let fname = user?.firstName,
    //            let lname = user?.lastName,
    //            let proStr = user?.profileStr {
    //
    //            UserDefaults.standard.setValue(uid, forKey: Key.Params.kUserId)
    //            UserDefaults.standard.setValue(access, forKey: Key.Params.kUserAccess)
    //            UserDefaults.standard.setValue(token, forKey: Key.Params.kToken)
    //            UserDefaults.standard.setValue(fname, forKey: Key.Params.kFName)
    //            UserDefaults.standard.setValue(lname, forKey: Key.Params.kLName)
    //            UserDefaults.standard.setValue(proStr, forKey: Key.Params.kTAvatar)
    //            UserDefaults.standard.synchronize()
    //
    //        }
    //    }
    //
    //    static func loadUserFromCache() -> User? {
    //        var usr:User? = nil
    //
    //        if let userId = Cache.extractString(Key.Params.kUserId),
    //            let userAuth = Cache.extractString(Key.Params.kToken),
    //            let userF = Cache.extractString(Key.Params.kFName),
    //            let userL = Cache.extractString(Key.Params.kLName),
    //            let userProfile = Cache.extractString(Key.Params.kTAvatar),
    //            let userAccess = Cache.extractString(Key.Params.kUserAccess) {
    //            usr = User()
    //            usr?.userId = userId
    //            usr?.userAuthToken = userAuth
    //            usr?.access = userAccess
    //            usr?.firstName = userF
    //            usr?.lastName = userL
    //            usr?.profileStr = userProfile
    //        }
    //
    //        return usr
    //    }
}

// MARK: - Constant Images
let GoogleApiKey = "AIzaSyC96ohCaQ1-znLFgpO0eqTtSSLv0QINzqU"
let placeHolder = UIImage(named:"logo")!
let smoothie = UIImage(named: "green_smoothie_white")!
let cgcs = UIImage(named: "cgcs_white")!
let reading = UIImage(named: "reading_white")!
let textMessage = UIImage(named: "text_message_white")!
let affirmation = UIImage(named: "affirmation_white")!
let nightly = UIImage(named:"nightly_ritual_white")!
let meditation = UIImage(named:"meditation_white")!

let workOutSelected = UIImage(named:"workout")!
let smoothieSelected = UIImage(named: "green_smoothie")!
let cgcsSelected = UIImage(named: "cgcs")!
let readingSelected = UIImage(named: "reading")!
let textMessageSelected = UIImage(named: "text_message")!
let affirmationSelected = UIImage(named: "affirmation")!
let nightlySelected = UIImage(named:"nightly_ritual")!
let meditationSelected = UIImage(named:"meditation")!


let monday = UIImage(named:"m_gray")!
let tuesday = UIImage(named: "t_gray")!
let wednesday = UIImage(named: "w_gray")!
let thursday = UIImage(named: "th_gray")!
let friday = UIImage(named: "f_gray")!
let saturday = UIImage(named: "sa_gray")!
let sunday = UIImage(named:"su_gray")!

let select_1 = UIImage(named:"select_1")!
let select_2 = UIImage(named: "select_2")!
let select_3 = UIImage(named: "select_3")!
let unselect_1 = UIImage(named: "unselect_1")!
let unselect_2 = UIImage(named: "unselect_2")!
let unselect_3 = UIImage(named: "unselect_3")!
let sundaySelected = UIImage(named:"su")!

let homeIcon = UIImage(named:"home_icon")!
let profileIcon = UIImage(named:"user_icon")!
let orderIcon = UIImage(named:"order_tracker")!
let addressIcon = UIImage(named:"address_icon")!
let logoutIcon = UIImage(named:"logout")!





let privacyText = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."
let termsText = "Lorem ipsum dolor sit er elit lamet, consectetaur cillium adipisicing pecu, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Nam liber te conscient to factor tum poen legum odioque civiuda."



let baseImage = "https://voxmenu.com/vox_apis/vox_menu/public/"

// MARK: - APIs
struct Api {
    
    
}

// MARK: - Extensions
//
extension String {

    func fromBase64() -> String? {
        guard let data = Data(base64Encoded: self) else {
            return nil
        }

        return String(data: data, encoding: .utf8)
    }

    func toBase64() -> String {
        return Data(self.utf8).base64EncodedString()
    }

}
extension Date {

    /// Returns a Date with the specified amount of components added to the one it is called with
    func add(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date? {
        let components = DateComponents(year: years, month: months, day: days, hour: hours, minute: minutes, second: seconds)
        return Calendar.current.date(byAdding: components, to: self)
    }

    /// Returns a Date with the specified amount of components subtracted from the one it is called with
    func subtract(years: Int = 0, months: Int = 0, days: Int = 0, hours: Int = 0, minutes: Int = 0, seconds: Int = 0) -> Date? {
        return add(years: -years, months: -months, days: -days, hours: -hours, minutes: -minutes, seconds: -seconds)
    }

}
extension Date {
    func dayNumberOfWeek() -> Int? {
        return Calendar.current.dateComponents([.weekday], from: self).weekday
    }
}
extension NSMutableAttributedString {
    var fontSize:CGFloat { return 17 }
    var boldFont:UIFont { return UIFont(name: "Gilroy-Bold", size: fontSize) ?? UIFont.boldSystemFont(ofSize: fontSize) }
    var normalFont:UIFont { return UIFont(name: "Gilroy-Regular", size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)}
    
    func bold(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : boldFont
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func normal(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font : normalFont,
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    /* Other styling methods */
    func orangeHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.orange
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func blackHighlight(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .foregroundColor : UIColor.white,
            .backgroundColor : UIColor.black
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
    
    func underlined(_ value:String) -> NSMutableAttributedString {
        
        let attributes:[NSAttributedString.Key : Any] = [
            .font :  normalFont,
            .underlineStyle : NSUnderlineStyle.single.rawValue
            
        ]
        
        self.append(NSAttributedString(string: value, attributes:attributes))
        return self
    }
}
extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vc, animated: animated)
        }
    }
}
extension UIView {
    
    func makeRoundedView() {
        
        //self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        //self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
extension UIImageView {
    
    func makeRounded() {
        
        //self.layer.borderWidth = 1
        self.layer.masksToBounds = false
        //self.layer.borderColor = UIColor.black.cgColor
        self.layer.cornerRadius = self.frame.height / 2
        self.clipsToBounds = true
    }
}
extension UIApplication {
    class func topViewController(controller: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        if let navigationController = controller as? UINavigationController {
            return topViewController(controller: navigationController.visibleViewController)
        }
        if let tabController = controller as? UITabBarController {
            if let selected = tabController.selectedViewController {
                return topViewController(controller: selected)
            }
        }
        if let presented = controller?.presentedViewController {
            return topViewController(controller: presented)
        }
        return controller
    } }
extension UIImage {
    func resizeImage(_ dimension: CGFloat, opaque: Bool, contentMode: UIView.ContentMode = .scaleAspectFit) -> UIImage {
        var width: CGFloat
        var height: CGFloat
        var newImage: UIImage
        
        let size = self.size
        let aspectRatio =  size.width/size.height
        
        switch contentMode {
        case .scaleAspectFit:
            if aspectRatio > 1 {                            // Landscape image
                width = dimension
                height = dimension / aspectRatio
            } else {                                        // Portrait image
                height = dimension
                width = dimension * aspectRatio
            }
            
        default:
            fatalError("UIIMage.resizeToFit(): FATAL: Unimplemented ContentMode")
        }
        
        if #available(iOS 10.0, *) {
            let renderFormat = UIGraphicsImageRendererFormat.default()
            renderFormat.opaque = opaque
            let renderer = UIGraphicsImageRenderer(size: CGSize(width: width, height: height), format: renderFormat)
            newImage = renderer.image {
                (context) in
                self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            }
        } else {
            UIGraphicsBeginImageContextWithOptions(CGSize(width: width, height: height), opaque, 0)
            self.draw(in: CGRect(x: 0, y: 0, width: width, height: height))
            newImage = UIGraphicsGetImageFromCurrentImageContext()!
            UIGraphicsEndImageContext()
        }
        
        return newImage
    }
}
extension String {
    func slice(from: String, to: String) -> String? {
        
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                substring(with: substringFrom..<substringTo)
            }
        }
    }
}
extension UIImage {
    
    convenience init?(barcode: String) {
        let data = barcode.data(using: .ascii)
        guard let filter = CIFilter(name: "CICode128BarcodeGenerator") else {
            return nil
        }
        filter.setValue(data, forKey: "inputMessage")
        guard let ciImage = filter.outputImage else {
            return nil
        }
        self.init(ciImage: ciImage)
    }
    //let barcode = UIImage(barcode: "some text") // yields UIImage?
}
extension Date {
    
    //An integer representation of age from the date object (read-only).
    var age: Int {
        get {
            let now = Date()
            let calendar = Calendar.current
            
            let ageComponents = calendar.dateComponents([.year], from: self, to: now)
            let age = ageComponents.year!
            return age
        }
    }
    
    init(year: Int, month: Int, day: Int) {
        var dc = DateComponents()
        dc.year = year
        dc.month = month
        dc.day = day
        
        var calendar = Calendar(identifier: .gregorian)
        calendar.timeZone = TimeZone(secondsFromGMT: 0)!
        if let date = calendar.date(from: dc) {
            self.init(timeInterval: 0, since: date)
        } else {
            fatalError("Date component values were invalid.")
        }
    }
    
}
extension String {
    var htmlToAttributedString: NSAttributedString? {
        guard let data = data(using: .utf8) else { return NSAttributedString() }
        do {
            return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
        } catch {
            return NSAttributedString()
        }
    }
    var htmlToString: String {
        return htmlToAttributedString?.string ?? ""
    }
}
extension String {
    
    enum RegularExpressions: String {
        case phone = "^\\s*(?:\\+?(\\d{1,3}))?([-. (]*(\\d{3})[-. )]*)?((\\d{3})[-. ]*(\\d{2,4})(?:[-.x ]*(\\d+))?)\\s*$"
    }
    
    func isValid(regex: RegularExpressions) -> Bool { return isValid(regex: regex.rawValue) }
    func isValid(regex: String) -> Bool { return range(of: regex, options: .regularExpression) != nil }
    
    func onlyDigits() -> String {
        let filtredUnicodeScalars = unicodeScalars.filter { CharacterSet.decimalDigits.contains($0) }
        return String(String.UnicodeScalarView(filtredUnicodeScalars))
    }
    
    func makeACall() {
        guard   isValid(regex: .phone),
            let url = URL(string: "tel://\(self.onlyDigits())"),
            UIApplication.shared.canOpenURL(url) else { return }
        if #available(iOS 10, *) {
            UIApplication.shared.open(url)
        } else {
            UIApplication.shared.openURL(url)
        }
    }
}
extension String {
    var textWidth: CGFloat {
        let font = UIFont.systemFont(ofSize: UIFont.systemFontSize)
        let attributes = [kCTFontAttributeName: font]
        return self.size(withAttributes: attributes as [NSAttributedString.Key : Any]).width
    }
}
extension String {
    
    func highlightWordsIn(highlightedWords: String, attributes: [[NSAttributedString.Key: Any]]) -> NSMutableAttributedString {
        let range = (self as NSString).range(of: highlightedWords)
        let result = NSMutableAttributedString(string: self)
        
        for attribute in attributes {
            result.addAttributes(attribute, range: range)
        }
        
        return result
    }
}
extension UIView {
    func fadeTo(_ alpha: CGFloat, duration: TimeInterval? = 0.3) {
        DispatchQueue.main.async {
            UIView.animate(withDuration: duration != nil ? duration! : 0.3) {
                self.alpha = alpha
            }
        }
    }
    
    func fadeIn(_ duration: TimeInterval? = 0.3) {
        fadeTo(1.5, duration: duration)
    }
    func fadeOut(_ duration: TimeInterval? = 0.3) {
        fadeTo(0.0, duration: duration)
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}

enum VerticalLocation: String {
    case bottom
    case top
}

extension UIView {
    func addShadow(location: VerticalLocation, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        switch location {
        case .bottom:
            addShadow(offset: CGSize(width: 0, height: 10), color: color, opacity: opacity, radius: radius)
        case .top:
            addShadow(offset: CGSize(width: 0, height: -20), color: color, opacity: opacity, radius: radius)
        }
    }
    
    func addShadow(offset: CGSize, color: UIColor = .black, opacity: Float = 0.5, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = offset
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
    
    func animShow(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveEaseIn],
                       animations: {
                        self.center.y -= self.bounds.height
                        self.layoutIfNeeded()
        }, completion: nil)
        self.isHidden = false
    }
    func animHide(){
        UIView.animate(withDuration: 0.5, delay: 0, options: [.curveLinear],
                       animations: {
                        self.center.y += self.bounds.height
                        self.layoutIfNeeded()
                        
        },  completion: {(_ completed: Bool) -> Void in
            self.isHidden = true
        })
    }
    
}

extension UIView {
    
    enum Visibility: String {
        case visible = "visible"
        case invisible = "invisible"
        case gone = "gone"
    }
    
    var visibility: Visibility {
        get {
            let constraint = (self.constraints.filter{$0.firstAttribute == .height && $0.constant == 0}.first)
            if let constraint = constraint, constraint.isActive {
                return .gone
            } else {
                return self.isHidden ? .invisible : .visible
            }
        }
        set {
            if self.visibility != newValue {
                self.setVisibility(newValue)
            }
        }
    }
    
    @IBInspectable
    var visibilityState: String {
        get {
            return self.visibility.rawValue
        }
        set {
            let _visibility = Visibility(rawValue: newValue)!
            self.visibility = _visibility
        }
    }
    
    private func setVisibility(_ visibility: Visibility) {
        let constraints = self.constraints.filter({$0.firstAttribute == .height && $0.constant == 0 && $0.secondItem == nil && ($0.firstItem as? UIView) == self})
        let constraint = (constraints.first)
        
        switch visibility {
        case .visible:
            constraint?.isActive = false
            self.isHidden = false
            break
        case .invisible:
            constraint?.isActive = false
            self.isHidden = true
            break
        case .gone:
            self.isHidden = true
            if let constraint = constraint {
                constraint.isActive = true
            } else {
                let constraint = NSLayoutConstraint(item: self, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .height, multiplier: 1, constant: 0)
                // constraint.priority = UILayoutPriority(rawValue: 999)
                self.addConstraint(constraint)
                constraint.isActive = true
            }
            self.setNeedsLayout()
            self.setNeedsUpdateConstraints()
        }
    }
}
extension URL {
    func valueOf(_ queryParamaterName: String) -> String? {
        guard let url = URLComponents(string: self.absoluteString) else { return nil }
        return url.queryItems?.first(where: { $0.name == queryParamaterName })?.value
    }
}
extension String {
    func height(withConstrainedWidth width: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: width, height: .greatestFiniteMagnitude)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.height)
    }
    
    func width(withConstrainedHeight height: CGFloat, font: UIFont) -> CGFloat {
        let constraintRect = CGSize(width: .greatestFiniteMagnitude, height: height)
        let boundingBox = self.boundingRect(with: constraintRect, options: .usesLineFragmentOrigin, attributes: [NSAttributedString.Key.font: font], context: nil)
        
        return ceil(boundingBox.width)
    }
}


extension UILabel
{
    var numberOfVisibleLines: Int
    {
        let textSize = CGSize(width: CGFloat(self.frame.size.width), height: CGFloat(MAXFLOAT))
        let rHeight: Int = lroundf(Float(self.sizeThatFits(textSize).height))
        let charSize: Int = lroundf(Float(self.font.pointSize))
        return rHeight / charSize
        
    }
    
}

extension StringProtocol {
    var firstUppercased: String {
        guard let first = first else { return "" }
        return String(first).uppercased() + dropFirst()
    }
    var firstCapitalized: String {
        guard let first = first else { return "" }
        return String(first).capitalized + dropFirst()
    }
}

extension UILabel {
    
    func addTrailing(with trailingText: String, moreText: String, moreTextFont: UIFont, moreTextColor: UIColor) {
        let readMoreText: String = trailingText + moreText
        
        let lengthForVisibleString: Int = self.vissibleTextLength
        let mutableString: String = self.text!
        let trimmedString: String? = (mutableString as NSString).replacingCharacters(in: NSRange(location: lengthForVisibleString, length: ((self.text?.count)! - lengthForVisibleString)), with: "")
        let readMoreLength: Int = (readMoreText.count)
        let trimmedForReadMore: String = (trimmedString! as NSString).replacingCharacters(in: NSRange(location: ((trimmedString?.count ?? 0) - readMoreLength), length: readMoreLength), with: "") + trailingText
        let answerAttributed = NSMutableAttributedString(string: trimmedForReadMore, attributes: [NSAttributedString.Key.font: self.font])
        let readMoreAttributed = NSMutableAttributedString(string: moreText, attributes: [NSAttributedString.Key.font: moreTextFont, NSAttributedString.Key.foregroundColor: moreTextColor])
        answerAttributed.append(readMoreAttributed)
        self.attributedText = answerAttributed
    }
    
    var vissibleTextLength: Int {
        let font: UIFont = self.font
        let mode: NSLineBreakMode = self.lineBreakMode
        let labelWidth: CGFloat = self.frame.size.width
        let labelHeight: CGFloat = self.frame.size.height
        let sizeConstraint = CGSize(width: labelWidth, height: CGFloat.greatestFiniteMagnitude)
        
        let attributes: [AnyHashable: Any] = [NSAttributedString.Key.font: font]
        let attributedText = NSAttributedString(string: self.text!, attributes: attributes as? [NSAttributedString.Key : Any])
        let boundingRect: CGRect = attributedText.boundingRect(with: sizeConstraint, options: .usesLineFragmentOrigin, context: nil)
        
        if boundingRect.size.height > labelHeight {
            var index: Int = 0
            var prev: Int = 0
            let characterSet = CharacterSet.whitespacesAndNewlines
            repeat {
                prev = index
                if mode == NSLineBreakMode.byCharWrapping {
                    index += 1
                } else {
                    index = (self.text! as NSString).rangeOfCharacter(from: characterSet, options: [], range: NSRange(location: index + 1, length: self.text!.count - index - 1)).location
                }
            } while index != NSNotFound && index < self.text!.count && (self.text! as NSString).substring(to: index).boundingRect(with: sizeConstraint, options: .usesLineFragmentOrigin, attributes: attributes as? [NSAttributedString.Key : Any], context: nil).size.height <= labelHeight
            return prev
        }
        return self.text!.count
    }
}

extension Int {
    init(random range: Range<Int>) {
        
        let offset: Int
        if range.startIndex < 0 {
            offset = abs(range.startIndex)
        } else {
            offset = 0
        }
        
        let min = UInt32(range.startIndex + offset)
        let max = UInt32(range.endIndex   + offset)
        
        self = Int(min + arc4random_uniform(max - min)) - offset
    }
}

extension UIImage {
    func imageWithColor(color1: UIColor) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(self.size, false, self.scale)
        color1.setFill()
        
        let context = UIGraphicsGetCurrentContext()
        context?.translateBy(x: 0, y: self.size.height)
        context?.scaleBy(x: 1.0, y: -1.0)
        context?.setBlendMode(CGBlendMode.normal)
        
        let rect = CGRect(origin: .zero, size: CGSize(width: self.size.width, height: self.size.height))
        context?.clip(to: rect, mask: self.cgImage!)
        context?.fill(rect)
        
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
}

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.5
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 1
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
    
    // OUTPUT 2
    func dropShadow(color: UIColor, opacity: Float = 0.5, offSet: CGSize, radius: CGFloat = 1, scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset = offSet
        layer.shadowRadius = radius
        
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

extension UITextField {
    func setLeftPaddingPoints(_ amount:CGFloat){
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
    func setRightPaddingPoints(_ amount:CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: amount, height: self.frame.size.height))
        self.rightView = paddingView
        self.rightViewMode = .always
    }
}

extension UITextView {
    func leftSpace() {
        self.textContainerInset = UIEdgeInsets(top: 6, left: 23, bottom: 0, right: 0)
    }
}
func getLinesArrayFromLabel(label:UILabel) -> [String] {
    
    let text:NSString = label.text! as NSString // TODO: Make safe?
    let font:UIFont = label.font
    let rect:CGRect = label.frame
    
    let myFont:CTFont = CTFontCreateWithName(font.fontName as CFString, font.pointSize, nil)
    let attStr:NSMutableAttributedString = NSMutableAttributedString(string: text as String)
    attStr.addAttribute(NSAttributedString.Key(rawValue: String(kCTFontAttributeName)), value:myFont, range: NSMakeRange(0, attStr.length))
    let frameSetter:CTFramesetter = CTFramesetterCreateWithAttributedString(attStr as CFAttributedString)
    let path:CGMutablePath = CGMutablePath()
    path.addRect(CGRect(x:0, y:0, width:rect.size.width, height:100000))
    
    let frame:CTFrame = CTFramesetterCreateFrame(frameSetter, CFRangeMake(0, 0), path, nil)
    let lines = CTFrameGetLines(frame) as NSArray
    var linesArray = [String]()
    
    for line in lines {
        let lineRange = CTLineGetStringRange(line as! CTLine)
        let range:NSRange = NSMakeRange(lineRange.location, lineRange.length)
        let lineString = text.substring(with: range)
        linesArray.append(lineString as String)
    }
    return linesArray
}


// MARK: - IBDesignable Extensions
@IBDesignable extension UIView {
    @IBInspectable var borderColor:UIColor? {
        set {
            layer.borderColor = newValue!.cgColor
        }
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor:color)
            }
            else {
                return nil
            }
        }
    }
    @IBInspectable var borderWidth:CGFloat {
        set {
            layer.borderWidth = newValue
        }
        get {
            return layer.borderWidth
        }
    }
    @IBInspectable var cornerRadius:CGFloat {
        set {
            layer.cornerRadius = newValue
            clipsToBounds = newValue > 0
        }
        get {
            return layer.cornerRadius
        }
    }
    @IBInspectable
    var shadowRadius: CGFloat {
        get {
            return layer.shadowRadius
        }
        set {
            layer.shadowRadius = newValue
        }
    }
    
    @IBInspectable
    var shadowOpacity: Float {
        get {
            return layer.shadowOpacity
        }
        set {
            layer.shadowOpacity = newValue
        }
    }
    
    @IBInspectable
    var shadowOffset: CGSize {
        get {
            return layer.shadowOffset
        }
        set {
            layer.shadowOffset = newValue
        }
    }
    
    @IBInspectable
    var shadowColor: UIColor? {
        get {
            if let color = layer.shadowColor {
                return UIColor(cgColor: color)
            }
            return nil
        }
        set {
            if let color = newValue {
                layer.shadowColor = color.cgColor
            } else {
                layer.shadowColor = nil
            }
        }
    }
    @IBInspectable var masksToBounds:Bool {
        set {
            layer.masksToBounds = newValue
        }
        get {
            return layer.masksToBounds
        }
    }
}


