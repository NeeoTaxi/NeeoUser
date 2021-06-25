//
//  HomeVC.swift
//  Shophive
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.

import UIKit


class SideBarVC: BaseVC {
    
    @IBOutlet weak var tableV: UITableView!
    
    @IBOutlet weak var dpImg: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    public var appInstallDate: Date {
        if let documentsFolder = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last {
            if let installDate = try! FileManager.default.attributesOfItem(atPath: documentsFolder.path)[.creationDate] as? Date {
                return installDate
            }
        }
        return Date() // Should never execute
    }
    
    var arr = ["Payment","My Adress","Order History","Settings","Support"]
    
    //var arr = ["Coming Soon","News","ChatRoom","Tutorial","Privacy Policy","Share","Buy Subscription","App Version(1.0)"]
    
    var user = Cache.extractCustomObject("user")
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        self.nameLabel.text = self.user?.name
//        self.emailLabel.text = self.user?.email
//        if self.user?.dp != "" && self.user?.dp != nil
//        {
//            let u = self.user?.dp ?? ""
//            let url = URL(string: u)
//            dpImg.kf.indicatorType = .activity
//            dpImg.kf.setImage(with: url,placeholder: placeHolder) { result in
//                // `result` is either a `.success(RetrieveImageResult)` or a `.failure(KingfisherError)`
//                switch result {
//                case .success(let value):
//                    // The image was set to image view:
//                    print(value.image)
//
//                    self.dpImg.image = value.image
//                    self.dpImg.makeRounded()
//                    self.dpImg.contentMode = .scaleAspectFit
//
//                    // From where the image was retrieved:
//                    // - .none - Just downloaded.
//                    // - .memory - Got from memory cache.
//                    // - .disk - Got from disk cache.
//                    print(value.cacheType)
//
//                    // The source object which contains information like `url`.
//                    print(value.source)
//
//                case .failure(let error):
//                    print(error) // The error happens
//                }
//            }
//        }
//        else
//        {
//            self.dpImg.image = UIImage(named:"logo")!
//            self.dpImg.makeRounded()
//        }
//
        setGestures()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        hideNavigationBar()
    }
    
    
    func setGestures()
    {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(editpic(gesture:)))
        
        dpImg.addGestureRecognizer(tapGesture)
        // make sure imageView can be interacted with by user
        dpImg.isUserInteractionEnabled = true
    }
    
    @objc func editpic(gesture: UIGestureRecognizer)
    {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let secondVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
        {
            self.navigationController?.pushViewController(secondVC, animated: true)
        }
    }
    
    func getTopMostViewController() -> UIViewController? {
        var topMostViewController = UIApplication.shared.keyWindow?.rootViewController
        
        while let presentedViewController = topMostViewController?.presentedViewController {
            topMostViewController = presentedViewController
        }
        
        return topMostViewController
    }
    
//    func checkInAppPurchaseStatus() -> Bool {
//        // Load the receipt from the app bundle.
//        let receiptURL = Bundle.main.appStoreReceiptURL
//        var receipt: Data? = nil
//        if let receiptURL = receiptURL {
//            do {
//                receipt = try Data(contentsOf: receiptURL)
//            }catch
//            {
//                return false
//            }
//        }
//        if let receipt = receipt {
//            let sandbox = receiptURL?.lastPathComponent == "sandboxReceipt"
//            // Create the JSON object that describes the request
//            
//            let requestContents = [
//                "receipt-data": receipt.base64EncodedString(options: []),
//                "password": "f4fd9628d93340dfa973388b24a709ae"
//            ]
//            var requestData: Data? = nil
//            do {
//                requestData = try JSONSerialization.data(
//                    withJSONObject: requestContents,
//                    options: [])
//            } catch {
//            }
//            
//            if let requestData = requestData {
//                // Create a POST request with the receipt data.
//                var storeURL = URL(string: "https://buy.itunes.apple.com/verifyReceipt")
//                if sandbox {
//                    storeURL = URL(string: "https://sandbox.itunes.apple.com/verifyReceipt")
//                }
//                var storeRequest: NSMutableURLRequest? = nil
//                if let storeURL = storeURL {
//                    storeRequest = NSMutableURLRequest(url: storeURL)
//                }
//                storeRequest?.httpMethod = "POST"
//                storeRequest?.httpBody = requestData
//                
//                var rs = false
//                //Can use sendAsynchronousRequest to request to Apple API, here I use sendSynchronousRequest
//                
//                var response: URLResponse?
//                var resData: Data? = nil
//                do {
//                    if let storeRequest = storeRequest {
//                        resData = try NSURLConnection.sendSynchronousRequest(storeRequest as URLRequest, returning: &response)
//                    }
//                } catch {
//                    return false
//                }
//                var jsonResponse: NSDictionary?
//                do {
//                    jsonResponse = try JSONSerialization.jsonObject(with: resData!, options: []) as? NSDictionary
//                } catch {
//                }
//                if jsonResponse == nil {
//                    rs = false
//                } else {
//                    print("jsonResponse:\(jsonResponse ?? [:])")
//                    
//                    let dictLatestReceiptsInfo = jsonResponse?["latest_receipt_info"] as? NSDictionary
//                    let expirationDateMs = (dictLatestReceiptsInfo?.value(forKeyPath: "@max.expires_date_ms") as? NSNumber)?.int64Value ?? 0
//                    let req = (jsonResponse?["receipt"]) as? NSDictionary
//                    let requestDateMs = (req?["request_date_ms"] as? NSNumber)?.int64Value ?? 0
//                    print(String(format: "%lld--%lld", expirationDateMs, requestDateMs))
//                    rs = (jsonResponse?["status"] as? NSNumber)?.intValue ?? 0 == 0 && (Int64(expirationDateMs) > requestDateMs)
//                }
//                return rs
//            } else {
//                return false
//            }
//        } else {
//            return false
//        }
//    }
//    
}

extension SideBarVC: UITableViewDelegate,UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! SideBarTVC
        
        cell.selectionStyle = .none
        cell.loadData(text: self.arr[indexPath.row], img: UIImage(named: "img\(indexPath.row)"))
        
        
        return cell
        
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        
        switch indexPath.row {
        case 0:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let secondVC = storyboard.instantiateViewController(withIdentifier: "PaymentVC") as? PaymentVC
            {
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
            break
        case 1:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let secondVC = storyboard.instantiateViewController(withIdentifier: "RatingVC") as? RatingVC
            {
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
            break
        case 2:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let secondVC = storyboard.instantiateViewController(withIdentifier: "HistoryVC") as? HistoryVC
            {
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
            break
        case 3:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let secondVC = storyboard.instantiateViewController(withIdentifier: "ResetVC") as? ResetVC
            {
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
            break
        case 4:
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            if let secondVC = storyboard.instantiateViewController(withIdentifier: "ProfileVC") as? ProfileVC
            {
                self.navigationController?.pushViewController(secondVC, animated: true)
            }
            break
        default:
            print("nothing")
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 63
    }
    
}




