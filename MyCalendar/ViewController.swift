//
//  ViewController.swift
//  MyCalendar
//
//  Created by 유재호 on 2022/09/11.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    @IBOutlet weak var fsCalendar: FSCalendar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fsCalendar.delegate = self
        fsCalendar.dataSource = self
        calendarUI()
        
    }
    
    func calendarUI() {
        fsCalendar.appearance.titleWeekendColor = .red
        fsCalendar.appearance.headerMinimumDissolvedAlpha = 0
    }
  

}



extension ViewController {
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        guard let modalPresentView = self.storyboard?.instantiateViewController(identifier: "TestViewController") as? TestViewController else { return }
        
        // 날짜를 원하는 형식으로 저장하기 위한 방법입니다.
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        modalPresentView.date = dateFormatter.string(from: date)

        self.present(modalPresentView, animated: true, completion: nil)
    }

}
