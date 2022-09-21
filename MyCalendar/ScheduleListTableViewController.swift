//
//  ScheduleListTableViewController.swift
//  MyCalendar
//
//  Created by 유재호 on 2022/09/18.
//

import UIKit

class ScheduleListTableViewController: UITableViewController {

    
    // MARK: - Table view data source

    // section 수
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }

    
    // 각 섹션별 row 수
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    // 각 row에 무엇을 보여줄지
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ScheduleListCell", for: indexPath)
        cell.textLabel?.text = "Section \(indexPath.section) Row \(indexPath.row)"
        return cell
    }

    // 각 section 에 무엇을 보여줄지
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

}
