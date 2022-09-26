//
//  ListMainViewController.swift
//  MyCalendar
//
//  Created by 유재호 on 2022/09/22.
//

import Foundation
import UIKit


class ListMainViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var selectedDate = Date()

    @IBOutlet weak var scheduleListTable: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scheduleListTable.delegate = self
        scheduleListTable.dataSource = self
       
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        scheduleListTable.reloadData()
    }
    
    
    
    
    //각 섹션별 row 수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event().eventsForDate(date: eventsList[section].date).count

    }
    
    //row에 들어갈 데이터
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scheduleListTable.dequeueReusableCell(withIdentifier: "ScheduleListCell") as! ScheduleListTableViewCell
        
        //현재 몇번째 section인지 파악
        let event = Event().eventsForDate(date: eventsList[indexPath.section].date)[indexPath.row]
        cell.scheduleListCellLabel.text = event.name
//        cell.label.text = data[indexPath.row]

        return cell
    }
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return eventsList.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        var formatter = DateFormatter()
        formatter.dateFormat = "yyyy년 MM월 dd일 E요일"
//        return "\(eventsList[section].date)"
        return formatter.string(from: eventsList[section].date)
        
        
    }
}
