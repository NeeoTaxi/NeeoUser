//
//  BaseVC.swift
//  Stokke
//
////  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.

class BaseVC: UIViewController, NVActivityIndicatorViewable {
    
    let sharedDelegate = UIApplication.shared.delegate as! AppDelegate
    let size = CGSize(width: 40, height: 40)
    var menuLeftNavigationController : SideMenuNavigationController!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //Hide keyBoard by touch outside
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    override func viewWillAppear(_ animated: Bool) {

    }
    
    func setGradientBackground() {
        let colorTop =  UIColor(red: 0.07, green: 0.32, blue: 0.86, alpha: 1.00).cgColor
        let colorBottom = UIColor(red: 0.02, green: 0.82, blue: 1.00, alpha: 1.00).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }

//    override var prefersStatusBarHidden: Bool {
//        return true
//    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func showSideBar() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.menuLeftNavigationController = storyboard.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? SideMenuNavigationController
        SideMenuManager.default.leftMenuNavigationController = menuLeftNavigationController

        self.menuLeftNavigationController.settings = makeSettings(width: 240)

        //         Enable gestures. The left and/or right menus must be set up above for these to work.
        //         Note that these continue to work on the Navigation Controller independent of the view controller it displays!

        //menuLeftNavigationController.statusBarEndAlpha = 0

        //        DispatchQueue.main.async {
        //            self.navigationItem.rightBarButtonItem?.badgeBGColor = UIColor(red:0.00, green:0.82, blue:0.40, alpha:1.0)
        //            self.navigationItem.rightBarButtonItem?.badgeValue = "\(5)"
        //        }
    }

    func hideSideBar() {
        // Define the menus
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        self.menuLeftNavigationController = storyboard.instantiateViewController(withIdentifier: "LeftMenuNavigationController") as? SideMenuNavigationController
        SideMenuManager.default.leftMenuNavigationController = menuLeftNavigationController



        // Setup gestures: the left and/or right menus must be set up (above) for these to work.
        // Note that these continue to work on the Navigation Controller independent of the view controller it displays!
        //        SideMenuManager.default.addPanGestureToPresent(toView: self.navigationController!.navigationBar)
        //        SideMenuManager.default.addScreenEdgePanGesturesToPresent(toView: self.navigationController!.view)

        // (Optional) Prevent status bar area from turning black when menu appears:
        //menuLeftNavigationController.statusBarEndAlpha = 0

        self.menuLeftNavigationController.settings = makeSettings(width: 0)
    }


    func makeSettings(width:Int) -> SideMenuSettings
    {
        let presentationStyle = SideMenuPresentationStyle.menuSlideIn

        var settings = SideMenuSettings()
        settings.presentationStyle = presentationStyle
        settings.menuWidth = CGFloat(width)

        return settings
    }
    
    func showActivityIndicator() {
        startAnimating(size, message:nil, type: .ballTrianglePath)
    }
    
    func showActivityIndicatorWithText(msg : String) {
        startAnimating(size, message:msg, type: .ballTrianglePath)
    }
    func hideActivityIndicator() {
        stopAnimating()
    }
    
    func transparentNavBar()
    {
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: UIBarMetrics.default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.view.backgroundColor = UIColor.clear
    }
    
    func showNavigationBar() {
        navigationController?.setNavigationBarHidden(false, animated: false)
    }
    
    func hideNavigationBar() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func hideTabBar() {
        self.tabBarController?.tabBar.isHidden = true
    }
    
    func showTabBar() {
        self.tabBarController?.tabBar.isHidden = false
    }
    
    @IBAction func dismissPresentedController() {
        dismiss(animated: true, completion: nil)
    }
    
    func timeInterval(timeAgo:String) -> String
    {
        let dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        let df = DateFormatter()
        
        df.dateFormat = dateFormat
        let dateWithTime = df.date(from: timeAgo)
        
        let interval = Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: dateWithTime!, to: Date())
        
        if let year = interval.year, year > 0 {
            return year == 1 ? "\(year)" + " " + "year ago" : "\(year)" + " " + "years ago"
        } else if let month = interval.month, month > 0 {
            return month == 1 ? "\(month)" + " " + "month ago" : "\(month)" + " " + "months ago"
        } else if let day = interval.day, day > 0 {
            return day == 1 ? "\(day)" + " " + "day ago" : "\(day)" + " " + "days ago"
        }else if let hour = interval.hour, hour > 0 {
            return hour == 1 ? "\(hour)" + " " + "hour ago" : "\(hour)" + " " + "hours ago"
        }else if let minute = interval.minute, minute > 0 {
            return minute == 1 ? "\(minute)" + " " + "minute ago" : "\(minute)" + " " + "minutes ago"
        }else if let second = interval.second, second > 0 {
            return second == 1 ? "\(second)" + " " + "second ago" : "\(second)" + " " + "seconds ago"
        } else {
            return "a moment ago"
            
        }
    }
    
    func getDateAccordingToFormat(date:Date?) -> Date?
    {
        var da : Date?
        if date != nil
        {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
            formatter.timeZone = TimeZone.current
            formatter.locale = .current
            let str = formatter.string(from: date!)
            da = formatter.date(from: str)
        }
        return da
    }
    
    func getDateStrAccordingToFormat(date:Date?) -> String?
    {
        var str = ""
        if date != nil
        {
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd/MM/yyyy HH:mm:ss"
            formatter.timeZone = TimeZone.current
            formatter.locale = .current
            str = formatter.string(from: date!)
        }
        return str
    }
    
    func addLeftNavigationButtonWithTitle(_ title : String) {
        navigationItem.leftBarButtonItem = nil
        let leftbarButton = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(leftNavigationButtonPressed))
        navigationItem.leftBarButtonItem = leftbarButton;
    }
    
    func addLeftNavigationButtonWithImage(_ image : String) {
        navigationItem.leftBarButtonItem = nil
        let rightbarButton = UIBarButtonItem(image: UIImage.init(named: image), style: .plain, target: self, action: #selector(leftNavigationButtonPressed))
        navigationItem.leftBarButtonItem = rightbarButton;
    }
    
    func addRightNavigationButtonWithTitle(_ title : String) {
        navigationItem.rightBarButtonItem = nil
        let rightbarButton = UIBarButtonItem(title: title, style: .plain, target: self, action: #selector(rightNavigationButtonPressed))
        navigationItem.rightBarButtonItem = rightbarButton;
    }
    
    func addRightNavigationButtonWithImage(_ image : String) {
        navigationItem.rightBarButtonItem = nil
        let rightbarButton = UIBarButtonItem(image: UIImage.init(named: image), style: .plain, target: self, action: #selector(rightNavigationButtonPressed))
        navigationItem.rightBarButtonItem = rightbarButton;
    }

    func removeRightBarButton() {
        navigationItem.rightBarButtonItem = nil
    }

    func removeLeftBarButton() {
        navigationItem.leftBarButtonItem = nil
    }
    
    func hideBackButton() {
        navigationItem.hidesBackButton = true
    }
    
    func showBackButton() {
        navigationItem.hidesBackButton = false
    }
    
    @IBAction func goBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @objc func leftNavigationButtonPressed() {
        
    }
    
    @objc func rightNavigationButtonPressed() {
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
}
