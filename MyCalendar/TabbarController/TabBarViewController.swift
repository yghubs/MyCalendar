//
//  CustomTabbar.swift
//  CalendarExampleTutorial
//
//  Created by 유재호 on 2022/09/10.
//

import Foundation
import SwiftUI
import SnapKit

class TabBarViewController: UITabBarController {
    
    
    var customTabBarView = UIView(frame: .zero)
    // MARK: View lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupTabBarUI()
        self.addCustomTabBarView()
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
    
    
    // MARK: Private methods
    //(0.0, 877.0, 428.0, 49.0)
    //(0.0, 763.0, 375.0, 49.0)
    private func addCustomTabBarView() {
        self.customTabBarView.frame = tabBar.frame
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.tabBar.layer.masksToBounds = false
        self.tabBar.layer.shadowColor = UIColor.black.withAlphaComponent(0.1).cgColor
        self.tabBar.layer.shadowOffset = CGSize(width: -4, height: -4)
        self.tabBar.layer.shadowOpacity = 0.9
        self.tabBar.layer.shadowRadius = 20
        
        self.view.bringSubviewToFront(self.tabBar)
    }
    private func setupTabBarUI() {
        // Setup your colors and corner radius
        self.tabBar.backgroundColor = .white
        self.tabBar.layer.cornerRadius = 30
        self.tabBar.layer.masksToBounds = true
        self.tabBar.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.tabBar.backgroundColor = .white
        self.tabBar.tintColor = .systemBlue
        self.tabBar.unselectedItemTintColor = .white
        
        // Remove the line
        if #available(iOS 13.0, *) {
            let appearance = self.tabBar.standardAppearance
            appearance.shadowImage = nil
            appearance.shadowColor = nil
            self.tabBar.standardAppearance = appearance
        } else {
            self.tabBar.shadowImage = UIImage()
            self.tabBar.backgroundImage = UIImage()
        }
    }
}

