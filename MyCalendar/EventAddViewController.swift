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
    @IBOutlet weak var datePicker: UIDatePicker!//    @IBOutlet weak var saveButton: UIButton!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        datePicker.date = selectedDate
//        saveButton.addTarget(self, action: #selector(tapSaveButton(_:)), for: .touchUpInside)

    }
    
    
    @IBAction func saveAction(_ sender: Any)
    {
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = nameTF.text
        newEvent.date = datePicker.date
        eventsList.append(newEvent)
        
        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "calendarVC")
            self.definesPresentationContext = true
            newVC?.modalPresentationStyle = .overCurrentContext
            self.present(newVC!, animated: true, completion: nil)
    }
    
//    @objc private func tapSaveButton(_ sender: Any){
//        
//        let nextVC = ViewController()
//        self.navigationController?.pushViewController(nextVC, animated: false)
//    }
    
}

