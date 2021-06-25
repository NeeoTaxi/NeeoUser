//
//  User.swift
//  Bata Loyalty Club
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.

import UIKit
import SwiftyJSON

struct HttpBinResponse: Codable {
    let url: String
}

class User: NSObject,Codable {
    
    private struct SerializationKeys {
        static let userid = "userid"
        static let email = "email"
        static let name = "name"
        static let phone = "phone"
        static let address = "address"
        static let created_at = "created_at"
        static let device_id = "device_id"
        static let activeaddress = "activeaddress"
    }
    
    @objc dynamic var userid                  : String?
    @objc dynamic var email                     : String?
    @objc dynamic var name                   : String?
    @objc dynamic var phone                  : String?
    @objc dynamic var address                     : String?
    @objc dynamic var created_at                   : String?
    @objc dynamic var device_id                     : String?
    @objc dynamic var activeaddress                   : String?
    
    
    // MARK: - Constructors
    
    public convenience init(object: Any) {
        self.init(json: JSON(object))
    }
    
    /// Initiates the instance based on the JSON that was passed.
    ///
    /// - parameter json: JSON object from SwiftyJSON.
    public required init(json: JSON) {
        
        
        userid = json[SerializationKeys.userid].string
        email = json[SerializationKeys.email].string
        name = json[SerializationKeys.name].string
        phone = json[SerializationKeys.phone].string
        address = json[SerializationKeys.address].string
        created_at = json[SerializationKeys.created_at].string
        device_id = json[SerializationKeys.device_id].string
        activeaddress = json[SerializationKeys.activeaddress].string
        
    }
    
    class func loginUser(withIdentity:String, andPassword:String, callBack:@escaping (_ msg: String,_ error: Bool ) -> Void) {
        
        
        let parameters: Parameters = [
            "email": withIdentity,
            "password": andPassword,
            "token": "HLFmtDn4rGOUsA4S7M71irrXFMfi0NAGxk90qEX4"
        ]
        
        AF.request("https://forms.greelogix.com/api/login", method: .post, parameters: parameters).responseJSON { response in
            print(response)
            switch (response.result) {
            case let .success(value):
                
                if let d = value as? NSDictionary
                {
                    let dict = d
                    var status = ""
                    var eMsg = ""
                    
                    if let s = dict.object(forKey: "status") as? String
                    {
                        status = s }
                    
                    if let m = dict.object(forKey: "error") as? String
                    {
                        eMsg = m }
                    
                    if (status == "failed")
                    {
                        callBack(eMsg,false)
                    }
                    else if (status == "success")
                    {
                        
                        var token = ""
                        
                        if let t = dict.object(forKey: "access_token") as? String
                        {
                            token = t }
                        
                        Cache.save(token, forKey: "token")
                        
                        let json = JSON(dict.object(forKey: "data") as Any).array
                        
                        if json?.indices.contains(0) ?? false
                        {
                            let user = User(json:(json?[0])!)
                            Cache.saveCustomObject(user, forKey: "User")
                        }
                        
                        callBack(eMsg,true)
                        
                    }
                    
                }
                break
            case let .failure(error):
                print(error)
                callBack("Something Went Wrong",false)
                break
            }
            
            
        }
    }
    
    class func getAccount(id:String?, callBack:@escaping (_ msg: String,_ error: Bool) -> Void) {
        
        
        let parameters: Parameters = [:]
        
        AF.request("\(APPURL.GetAccount)\(id ?? "")", method: .post, parameters: parameters).responseJSON { response in
            print(response)
            switch (response.result) {
            case let .success(value):
                
                if let d = value as? NSDictionary
                {
                    
                    if let arr = d.object(forKey: "EBOOK_APP") as? NSArray
                    {
                        if arr.count > 0
                        {
                            if let di = arr[0] as? NSDictionary
                            {
                                print(d)
                                let dict = di
                                var status = ""
                                var eMsg = ""
                                
                                if let s = dict.object(forKey: "success") as? String
                                {
                                    status = s
                                }
                                
                                if let m = dict.object(forKey: "msg") as? String
                                {
                                    eMsg = m
                                }
                                
                                if status == "1"
                                {
                                    let json = JSON(d.object(forKey: "EBOOK_APP") as Any).array
                                    
                                    if json?.indices.contains(0) ?? false
                                    {
                                        let user = User(json:(json?[0])!)
                                        Cache.saveCustomObject(user, forKey: "User")
                                    }
                                    callBack(eMsg, true)
                                }
                                else
                                {
                                    callBack(eMsg, false)
                                }
                            }
                            else
                            {
                                callBack("Something Went Wrong", false)
                            }
                        }
                        else
                        {
                            callBack("Something Went Wrong", false)
                        }
                    }
                    else
                    {
                        callBack("Something Went Wrong", false)
                    }
                    
                    
                    
                }
                break
            case let .failure(error):
                print(error)
                callBack("Something Went Wrong",false)
                break
            }
            
            
        }
    }
    
    class func getRefferals(withIdentity:Int?, ref:String?,callBack:@escaping (_ msg: String,_ error: Bool,_ userArray: [User]?) -> Void) {
        
        
        let parameters: Parameters = [
            "id": withIdentity ?? 0,
            "ReffCode":ref ?? ""
        ]
        
        AF.request(APPURL.GetReferrals, method: .post, parameters: parameters).responseJSON { response in
            print(response)
            switch (response.result) {
            case let .success(value):
                
                if let d = value as? NSArray
                {
                    print(d)
                    let dictt = d
                    var status = false
                    var eMsg = ""
                    
                    
                    if dictt.count > 0
                    {
                        if let dic0 = dictt[0] as? NSDictionary
                        {
                            let dict = dic0
                            if let s = dict.object(forKey: "IsSuccess") as? Bool
                            {
                                status = s }
                            
                            if let m = dict.object(forKey: "Message") as? String
                            {
                                eMsg = m
                                if m.lowercased() == "failure"
                                {
                                    eMsg = "No Information Found!"
                                }
                            }
                            
                            if (!status)
                            {
                                callBack(eMsg, false,nil)
                            }
                            else if (status)
                            {
                                var list = [User]()
                                
                                let json = JSON(dict.object(forKey: "Data") as Any).array
                                
                                if json?.indices.contains(0) ?? false
                                {
                                    for rec in json! {
                                        list.append(User(json:rec as JSON))
                                    }
                                    
                                }
                                
                                
                                callBack(eMsg,true,list)
                            }
                        }
                        
                    }
                    
                }
                break
            case let .failure(error):
                print(error)
                callBack("Something Went Wrong",false,nil)
                break
            }
            
            
        }
    }
    
    class func getUserProfile(withIdentity:String?, callBack:@escaping (_ msg: String,_ error: Bool,_ userObj: User? ) -> Void) {
        
        
        let parameters: Parameters = [
            "EncMobileNo": withIdentity ?? "3458430372"
        ]
        
        AF.request(APPURL.GetProfile, method: .post, parameters: parameters).responseJSON { response in
            print(response)
            switch (response.result) {
            case let .success(value):
                
                if let d = value as? NSArray
                {
                    
                    if d.count > 0
                    {
                        
                        let json = JSON(value).array
                        
                        let user = User(json:(json?[0])!)
                        
                        
                        callBack("",true,user)
                        
                    }
                    else
                    {
                        callBack("No Information Found",false,nil)
                    }
                    
                }
                break
            case let .failure(error):
                print(error)
                callBack("Something Went Wrong",false,nil)
                break
            }
            
            
        }
    }
    class func ResetPassword(withIdentity:String, callBack:@escaping (_ msg: String,_ error: Bool) -> Void) {
        
        let parameters: Parameters = [:]
        
        AF.request("https://voxmenu.com/contactmail/forgotpass/user/pwd_reset.php?email=\(withIdentity)", method: .get, parameters: parameters).responseJSON { response in
            print(response)
            switch (response.result) {
            case let .success(value):
                
                if let d = value as? NSDictionary
                {
                    let dict = d
                    var status = ""
                    var eMsg = ""
                    
                    if let s = dict.object(forKey: "status") as? String
                    {
                        status = s }
                    
                    if let m = dict.object(forKey: "error") as? String
                    {
                        eMsg = m }
                    
                    if (status == "failed")
                    {
                        callBack(eMsg,false)
                    }
                    else if (status == "success")
                    {
                       
                        callBack(eMsg,true)
                        
                    }
                    
                }
                break
            case let .failure(error):
                print(error)
                callBack("Something Went Wrong",false)
                break
            }
        }
        
        
    }
    
    class func registerUser(email:String, password:String, phone:String,name:String,device_id:String, callBack:@escaping (_ msg: String,_ error: Bool ) -> Void) {
        
        let parameters: Parameters = [
            "email": email,
            "password": password,
            "name": name,
            "phone": phone,
            "device_id":device_id,
            "address":"nil"
        ]
        
        
        AF.request(APPURL.SignUp, method: .post, parameters: parameters).responseJSON { response in
            
            print(response)
            switch (response.result) {
            case let .success(value):
                
                if let d = value as? NSDictionary
                {
                    
                    let dict = d
                    var status = ""
                    var eMsg = ""
                    
                    if let s = dict.object(forKey: "status") as? String
                    {
                        status = s }
                    
                    if let m = dict.object(forKey: "error") as? String
                    {
                        eMsg = m }
                    
                    if (status == "failed")
                    {
                        callBack(eMsg, false)
                    }
                    else if (status == "success")
                    {
                        
                        var token = ""
                        
                        
                        if let t = dict.object(forKey: "token") as? String
                        {
                            token = t }
                        
                        Cache.save(token, forKey: "uToken")
                        
                        let json = JSON(dict.object(forKey: "data") as Any).array
                        
                        if json?.indices.contains(0) ?? false
                        {
                            let user = User(json:(json?[0])!)
                            Cache.saveCustomObject(user, forKey: "User")
                        }
                        
                        
                        callBack(eMsg, true)
                    }
                    
                    
                }
                break
            case let .failure(error):
                print(error)
                callBack("Something Went Wrong", false)
                break
            }
            
            
            
        }
    }
    
    
    class func registerUserFBTwitter(email:String, type:String, name:String, callBack:@escaping (_ msg: String,_ error: Bool,_ userID:String ) -> Void) {
        
        let parameters: Parameters = ["user_type":type,"email":email,"full_name":name]
        
        AF.request(APPURL.SignUpSocial, method: .post, parameters: parameters,encoding: JSONEncoding.default).responseJSON { response in
            
            print(response)
            switch (response.result) {
            case let .success(value):
                
                print(response)
                if let d = value as? NSDictionary
                {
                    var status = false
                    var msg = ""
                    var userID = ""
                    
                    if let s = d.object(forKey: "status") as? Bool
                    {
                        status = s
                    }
                    
                    if let m = d.object(forKey: "message") as? String
                    {
                        msg = m
                    }
                    
                    if let m = d.object(forKey: "user_id") as? String
                    {
                        userID = m
                    }
                    
                    if status
                    {
                        callBack(msg,true,userID)
                    }
                    else
                    {
                        callBack(msg,false,userID)
                    }
                    
                }
                break
            case let .failure(error):
                print(error)
                callBack("Something Went Wrong", false,"")
                break
            }
            
            
            
        }
    }
    
    class func updatePassword(token:String?,old:String,new:String, callBack:@escaping (_ msg: String,_ error: Bool ) -> Void)
    {
        
        
        let parameters: Parameters = [
            "token":token ?? "",
            "new_password":new,
            "old_password": old
        ]
        
        AF.request(APPURL.UpdatePassword, method: .post, parameters: parameters).responseJSON { response in
            
            print(response)
            switch (response.result) {
            case let .success(value):
                
                if let d = value as? NSDictionary
                {
                    let dict = d
                    var status = ""
                    var eMsg = ""
                    
                    if let s = dict.object(forKey: "status") as? String
                    {
                        status = s }
                    
                    if let m = dict.object(forKey: "error") as? String
                    {
                        eMsg = m }
                    
                    if (status == "failed")
                    {
                        callBack(eMsg,false)
                    }
                    else if (status == "success")
                    {
                        
                        callBack(eMsg,true)
                        
                    }
                    
                }
                break
            case let .failure(error):
                print(error)
                callBack("Something Went Wrong", false)
                break
            }
            
        }
    }
    
    class func updatePasswordProfile(numb:String?,new:String, old:String, callBack:@escaping (_ msg: String,_ error: Bool ) -> Void)
    {
        
        
        let parameters: Parameters = [
            "EncMobileNo":numb ?? "",
            "PinCode": new,
            "OldPin": old,
        ]
        
        AF.request(APPURL.ChangePin, method: .post, parameters: parameters).responseJSON { response in
            
            print(response)
            switch (response.result) {
            case let .success(value):
                
                if let d = value as? NSArray
                {
                    print(d)
                    let dictt = d
                    var status = false
                    var eMsg = ""
                    
                    if dictt.count > 0
                    {
                        if let dic0 = dictt[0] as? NSDictionary
                        {
                            let dict = dic0
                            if let s = dict.object(forKey: "IsSuccess") as? Bool
                            {
                                status = s
                                print(status)
                            }
                            
                            if let m = dict.object(forKey: "ModifiedDate") as? String
                            {
                                eMsg = m }
                            
                            if eMsg == ""
                            {
                                callBack("Something went wrong.Try again later.", false)
                            }
                            else
                            {
                                callBack(eMsg, true)
                            }
                        }
                        else
                        {
                            callBack("Something went wrong.Try again later.",false)
                        }
                        
                    }
                    else
                    {
                        callBack("Something went wrong.Try again later.",false)
                    }
                    
                    
                }
                break
            case let .failure(error):
                print(error)
                callBack("Something Went Wrong", false)
                break
            }
            
        }
    }
    
    class func logoutUser(token:String?,callBack:@escaping (_ msg: String,_ error: Bool) -> Void)
    {
        
        let parameters: Parameters = [:]
        
        AF.request("\(APPURL.LogOut)\(token ?? "")", method: .get, parameters: parameters).responseJSON { response in
            
            print(response)
            switch (response.result) {
            case let .success(value):
                
                if let d = value as? NSDictionary
                {
                    
                    let dict = d
                    var status = ""
                    var eMsg = ""
                    
                    if let s = dict.object(forKey: "status") as? String
                    {
                        status = s }
                    
                    if let m = dict.object(forKey: "error") as? String
                    {
                        eMsg = m }
                    
                    if (status == "failed")
                    {
                        callBack(eMsg, false)
                    }
                    else if (status == "success")
                    {
                        
                        callBack(eMsg, true)
                    }
                    
                }
                break
            case .failure( _):
                callBack("Something Went Wrong", false)
                break
            }
            
        }
    }
    
    
    class func updateProfile(token:String?, name:String, phone:String, callBack:@escaping (_ msg: String,_ error: Bool ) -> Void)
    {
        
        
        let parameters: Parameters = [
            "token":token ?? "",
            "name": name,
            "phone": phone,
        ]
        
        
        AF.request(APPURL.UpdateProfile, method: .post, parameters: parameters).responseJSON { response in
            
            print(response)
            switch (response.result) {
            case let .success(value):
                
                if let d = value as? NSDictionary
                {
                    let dict = d
                    var status = ""
                    var eMsg = ""
                    
                    if let s = dict.object(forKey: "status") as? String
                    {
                        status = s }
                    
                    if let m = dict.object(forKey: "error") as? String
                    {
                        eMsg = m }
                    
                    if (status == "failed")
                    {
                        callBack(eMsg,false)
                    }
                    else if (status == "success")
                    {
                        
                        let json = JSON(dict.object(forKey: "data") as Any).array
                        
                        if json?.indices.contains(0) ?? false
                        {
                            let user = User(json:(json?[0])!)
                            Cache.saveCustomObject(user, forKey: "User")
                        }
                        
                        callBack(eMsg,true)
                        
                    }
                    
                }
                break
            case let .failure(error):
                print(error)
                callBack("Something Went Wrong", false)
                break
            }
            
        }
    }
}
