//
//  ViewController.swift
//  MyCalendar
//
//  Created by 유재호 on 2022/09/11.
//

import UIKit
import FSCalendar

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    @IBOutlet weak var fsCalendar: FSCalendar!
    @IBOutlet weak var scheduleTable: UITableView!
    let data = ["친구랑 밥먹기", "13시 헬스", "카페에서 공부하기"]
    
    var selectedDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        fsCalendar.delegate = self
        fsCalendar.dataSource = self
        scheduleTable.delegate = self
        scheduleTable.dataSource = self
        calendarUI()
        
    }
    
    func calendarUI() {
        fsCalendar.appearance.titleWeekendColor = .red
        fsCalendar.appearance.headerMinimumDissolvedAlpha = 0
        
        
        // 캘린더의 cornerRadius 지정
//        fsCalendar.layer.cornerRadius = 20

         //캘린더 숫자와 subtitle간의 간격 조정
//        self.fsCalendar.appearance.subtitleOffset = CGPoint(x: 0, y: 10)
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return data.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        let cell = scheduleTable.dequeueReusableCell(withIdentifier: "ScheduleCell") as! ScheduleTableViewCell
        cell.label.text = data[indexPath.row]
        
        
        return cell
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
