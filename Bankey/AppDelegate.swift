//
//  AppDelegate.swift
//  Bankey
//
//  Created by Bruno Madeira on 16/10/2024.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        window?.rootViewController = LoginViewController()
        
        return true
    }


}

