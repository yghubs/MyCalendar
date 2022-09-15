//
//  EventAddViewController.swift
//  MyCalendar
//
//  Created by 유재호 on 2022/09/13.
//

import UIKit

class EventAddViewController: UIViewController
{
    
    @IBOutlet weak var nameTF: UITextField!

    @IBOutlet weak var datePicker: UIDatePicker!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        datePicker.date = selectedDate
        
    }
    
    
    @IBAction func saveAction(_ sender: Any)
    {
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = nameTF.text
        newEvent.date = datePicker.date
        eventsList.append(newEvent)
    }
    
    
}

