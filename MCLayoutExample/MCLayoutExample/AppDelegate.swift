//
//  AppDelegate.swift
//  MCLayoutExample
//
//  Created by Luc Dion on 2016-09-03.
//  Copyright © 2016 Mirego. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window!.backgroundColor = UIColor.white
        window!.rootViewController = UINavigationController(rootViewController: MenuViewController())
        window!.makeKeyAndVisible()

        return true
    }

}

