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
    
    @IBOutlet weak var saveButton: UIBarButtonItem!
    override func viewDidLoad()
    {
        super.viewDidLoad()
        datePicker.date = selectedDate
//        saveButton.addTarget(self, action: #selector(tapSaveButton(_:)), for: .touchUpInside)
        self.navigationController?.navigationBar.isHidden = false
////        saveButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(tapSaveButton(_:)))
//        saveButton.action = #selector(tapSaveButton(_:))
//        saveButton.target = self
        
//        saveButton = UIBarButtonItem(title: "저장", style: .done, target: self, action: #selector(tapSaveButton(_:)))
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = true
    }
    
    
    @IBOutlet weak var asdfa: UILabel!
    
    @IBAction func saveAction(_ sender: Any) {
        let newEvent = Event()
        newEvent.id = eventsList.count
        newEvent.name = nameTF.text
        newEvent.date = datePicker.date
        eventsList.append(newEvent)
        

        //로컬에 일정들을 저장
//        UserDefaults.standard.set(eventsList, forKey: "userEvent")
//
//        let userEvent:String = UserDefaults.standard.object(forKey: "UserEvent") as! String
        guard let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "calendarVC") as? ViewController else { return }
        
        self.navigationController?.pushViewController(pushVC, animated: true)
        selectedDate = datePicker.date
        
    }
    
      
//
//        let newVC = self.storyboard?.instantiateViewController(withIdentifier: "calendarVC")
//            self.definesPresentationContext = true
//
//        newVC?.modalPresentationStyle = .fullScreen
//            self.present(newVC!, animated: true, completion: nil)
     
        
  
    
//    @objc private func tapSaveButton(_ sender: Any){
//
//        let nextVC = ViewController()
//        self.navigationController?.pushViewController(nextVC, animated: false)
//    }
    
}

