//
//  AppDelegate.swift
//  Neeo Taxi
//
//  Created by Mohsin Raza on 14/03/2021.
//  Copyright © 2021 Mohsin Raza . All rights reserved.

import UIKit
import GoogleMaps
import GooglePlaces

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        IQKeyboardManager.shared.enable = true
        GMSPlacesClient.provideAPIKey("AIzaSyC96ohCaQ1-znLFgpO0eqTtSSLv0QINzqU")
        GMSServices.provideAPIKey("AIzaSyC96ohCaQ1-znLFgpO0eqTtSSLv0QINzqU")
        return true
    }

}

