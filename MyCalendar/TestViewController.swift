//
//  TestViewController.swift
//  MyCalendar
//
//  Created by 유재호 on 2022/09/11.
//

import UIKit


class TestViewController: UIViewController {
    
    @IBOutlet weak var dateLabel: UILabel!
    var date: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.dateLabel.text = date
    }
}
