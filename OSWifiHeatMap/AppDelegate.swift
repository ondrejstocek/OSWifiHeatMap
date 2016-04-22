//
//  AppDelegate.swift
//  OSWifiHeatMap
//
//  Created by Ondrej Stocek on 20/04/16.
//  Copyright © 2016 Ondrej Stocek. All rights reserved.
//

import UIKit
import CoreLocation

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    lazy var locationManager: CLLocationManager = {
        return CLLocationManager()
    }()
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        locationManager.requestWhenInUseAuthorization()
        return true
    }
}

