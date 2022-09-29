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
    @IBAction func nextTapped(_ sender:UIButton) {
        fsCalendar.setCurrentPage(getNextMonth(date: fsCalendar.currentPage), animated: true)
    }
    @IBOutlet weak var nextMonthButton: UIButton!
    @IBOutlet weak var previousMonthButton: UIButton!
    @IBAction  func previousTapped(_ sender:UIButton) {
        fsCalendar.setCurrentPage(getPreviousMonth(date: fsCalendar.currentPage), animated: true)
    }
    
    var items: [Item] = []
    var elementName: String = String()
    var locdate = String()
    var dateName = String()
    var holidayDates = [Date]()
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedDate = Date()
        fsCalendar.delegate = self
        fsCalendar.dataSource = self
        scheduleTable.delegate = self
        scheduleTable.dataSource = self
        calendarUI()
        
        goToEventButton.superview?.bringSubviewToFront(goToEventButton)
        previousMonthButton.superview?.bringSubviewToFront(previousMonthButton)
        nextMonthButton.superview?.bringSubviewToFront(nextMonthButton)
        holidayParsing()
        markingDotOnHoliday()
        //로컬에 저장된 일정들을 불러오기
        //        if let aUser:Event? = UserDefaults.standard.object(forKey: "UserEvent") as! Event {
        //        eventsList.append(aUser!)
        //        }
        
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.isHidden = true
        self.tabBarController?.tabBar.isHidden = false
    }
    
    
    func calendarUI() {
        fsCalendar.appearance.titleWeekendColor = .red
        fsCalendar.appearance.headerMinimumDissolvedAlpha = 0
        fsCalendar.appearance.eventDefaultColor = UIColor.black
        fsCalendar.appearance.eventSelectionColor = UIColor.black
        fsCalendar.locale = Locale(identifier: "ko_KR")
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
    
    func getNextMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: 1, to:date)!
    }
    
    func getPreviousMonth(date:Date)->Date {
        return  Calendar.current.date(byAdding: .month, value: -1, to:date)!
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


extension ViewController: XMLParserDelegate {
    
    func holidayParsing() {
        if let path = Bundle.main.url(forResource: "holiday_2022", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
    }
    func parser(_ parser: XMLParser, didStartElement elementName: String, namespaceURI: String?, qualifiedName qName: String?, attributes attributeDict: [String : String] = [:]) {
        
        if elementName == "item" {
            locdate = String()
            dateName = String()
        }
        
        self.elementName = elementName
    }
    
    // 2
    func parser(_ parser: XMLParser, didEndElement elementName: String, namespaceURI: String?, qualifiedName qName: String?) {
        if elementName == "item" {
            let item = Item(dateName: dateName, locdate: locdate)
            items.append(item)
        }
    }
    
    // 3
    func parser(_ parser: XMLParser, foundCharacters string: String) {
        let data = string.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        
        if (!data.isEmpty) {
            if self.elementName == "dateName" {
                dateName += data
            } else if self.elementName == "locdate" {
                locdate += data
            }
        }
    }
    
    func calendar(_ calendar: FSCalendar, numberOfEventsFor date: Date) -> Int {
        if self.holidayDates.contains(date){
            return 1
        }
        return 0
    }
    
    
    func markingDotOnHoliday() {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ko_KR")
        formatter.dateFormat = "yyyyMMdd"
        
        let xmas = formatter.date(from: "20191225")
        let sampledate = formatter.date(from: "20191222")
            
        for i in 0..<items.count {
            var holidayStringToDateform = formatter.date(from: items[i].locdate)
            holidayDates.append(holidayStringToDateform!)
            
        }
    }
    
    
    
    
}
