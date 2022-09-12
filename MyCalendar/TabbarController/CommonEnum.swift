//
//  CommonEnum.swift
//  CalendarExampleTutorial
//
//  Created by 유재호 on 2022/09/10.
//

import Foundation
import UIKit
enum TabItem: String, CaseIterable {
    case calendar = "달력"
    case list = "일정"
    case routine = "반복 루틴"
    
    var viewController: UIViewController {
        switch self {
        case .calendar:
            return ViewController()
        case .list:
            return ListViewController()
        case .routine:
            return RoutineViewController()
            
        }
    }
    
    
    var icon: UIImage {
        switch self {
        case .calendar:
            return UIImage(systemName: "calendar")!
        case .list:
            return UIImage(systemName: "list.bullet.rectangle.portrait")!
        case .routine:
            return UIImage(systemName: "repeat")!
        }
    }
    
    var displayTitle: String {
        return self.rawValue.capitalized(with: nil)
    }
}
