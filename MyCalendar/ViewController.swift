//
//  ViewController.swift
//  MyCalendar
//
//  Created by 유재호 on 2022/09/11.
//

import UIKit
import FSCalendar

var selectedDate = Date()

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, FSCalendarDelegate, FSCalendarDataSource, FSCalendarDelegateAppearance {

    
    
    
    @IBOutlet weak var fsCalendar: FSCalendar!
    @IBOutlet weak var scheduleTable: UITableView!
    @IBOutlet weak var goToEventButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedDate = Date()
        fsCalendar.delegate = self
        fsCalendar.dataSource = self
        scheduleTable.delegate = self
        scheduleTable.dataSource = self
        calendarUI()
//        goToEventAddButton.addTarget(self, action: #selector(tapGoToEventAddButton(_:)), for: .touchUpInside)
        goToEventButton.superview?.bringSubviewToFront(goToEventButton)
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
        return Event().eventsForDate(date: selectedDate).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scheduleTable.dequeueReusableCell(withIdentifier: "ScheduleCell") as! ScheduleTableViewCell
        let event = Event().eventsForDate(date: selectedDate)[indexPath.row]
        cell.label.text = event.name
//        cell.label.text = data[indexPath.row]
        return cell
    }
//
//    @objc private func tapGoToEventAddButton(_ sender: Any){
//
//            let nextVC = EventAddViewController()
//            self.navigationController?.pushViewController(nextVC, animated: true)
//
//    }
  
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {

        selectedDate = date
        scheduleTable.reloadData()
    }
    
    
    override open var shouldAutorotate: Bool
    {
        return false
    }
//    버튼 눌러서 달 바꾸기
//    private func moveCurrentPage(moveUp: Bool) {
//        dateComponents.month = moveUp ? 1 : -1
//        self.currentPage = calendarCurrent.date(byAdding: dateComponents, to: self.currentPage ?? self.today)
//        self.calendar.setCurrentPage(self.currentPage!, animated: true)
//    }
//
//    @objc func tappedPrevBtn(_ sender: Any) {
//        self.moveCurrentPage(moveUp: false)
//    }
//
//    @objc func tappedNextBtn(_ sender: Any) {
//        self.moveCurrentPage(moveUp: true)
//    }
}


// 날짜 탭하면 그 날의 Date 정보를 새로운 모달로 띄우기
//extension ViewController {
//    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
//        guard let modalPresentView = self.storyboard?.instantiateViewController(identifier: "TestViewController") as? TestViewController else { return }
//
//        // 날짜를 원하는 형식으로 저장하기 위한 방법입니다.
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy-MM-dd"
//        modalPresentView.date = dateFormatter.string(from: date)
//
//        self.present(modalPresentView, animated: true, completion: nil)
//    }
//}
