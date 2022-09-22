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
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Event().eventsForDate(date: selectedDate).count

    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = scheduleListTable.dequeueReusableCell(withIdentifier: "ScheduleListCell") as! ScheduleListTableViewCell
        let event = Event().eventsForDate(date: selectedDate)[indexPath.row]
        cell.scheduleListCellLabel.text = event.name
//        cell.label.text = data[indexPath.row]
        
        return cell
    }
}



