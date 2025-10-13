//
//  UIViewController+Utils.swift
//  Bankey
//
//  Created by Bruno Madeira on 22/03/2025.
//

import UIKit

extension UIViewController {

    
    func setStatusBar() {
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let statusBarManager = windowScene?.statusBarManager
        let statusBarSize = statusBarManager?.statusBarFrame.size
        print("Status bar size: \(String(describing: statusBarSize))")
        let frame = CGRect(origin: .zero, size: statusBarSize ?? .zero)
        
        let statusBarView = UIView(frame: frame)
        statusBarView.backgroundColor = appColor
        view.addSubview(statusBarView)
    }
    
    func setTabBarImage(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
