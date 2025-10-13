//
//  AppDelegate.swift
//  Bankey
//
//  Created by Bruno Madeira on 16/10/2024.
//

import UIKit

let appColor: UIColor = .systemTeal

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    let loginViewController = LoginViewController()
    let onboardingContainerViewController = OnboardingContainerViewController()
    let dummyViewController = DummyViewController()
    let mainViewController = MainViewController()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .systemBackground
        window?.makeKeyAndVisible()
        
        loginViewController.delegate = self
        onboardingContainerViewController.delegate = self
        dummyViewController.logoutDelegate = self
        
       // window?.rootViewController = mainViewController
        
        window?.rootViewController = AccountSummaryViewController()
        mainViewController.selectedIndex = 1
        
        return true
    }
}


extension AppDelegate: LoginViewControllerDelegate, OnboardingContainerViewControllerDelegate, LogoutDelegate {
    func didLogout() {
        setRootViewController(loginViewController)
    }

    func didFinishOnboarding() {
        LocalState.hasOnboarded = true
        setRootViewController(dummyViewController)
    }

    func didlogin() {
        if LocalState.hasOnboarded {
            setRootViewController(dummyViewController)
        } else {
            setRootViewController(onboardingContainerViewController)
        }
    }
}

extension AppDelegate {
    func setRootViewController(_ vc: UIViewController, animated: Bool = true) {
        guard animated, let window = self.window else {
            self.window?.rootViewController = vc
            self.window?.makeKeyAndVisible()
            return
        }
        
        window.rootViewController = vc
        window.makeKeyAndVisible()
        
        UIView.transition(with: window,
                          duration: 0.3,
                          options: .transitionCrossDissolve,
                          animations: nil,
                          completion: nil)
    }
}
