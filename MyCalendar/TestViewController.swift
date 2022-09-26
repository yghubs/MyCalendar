//
//  TestViewController.swift
//  MyCalendar
//
//  Created by 유재호 on 2022/09/11.
//

import UIKit


class TestViewController: UIViewController, XMLParserDelegate {
    
 
//    @IBOutlet weak var dateLabel: UILabel!
//    var date: String!
//
    var items: [Item] = []
    var elementName: String = String()
    var locdate = String()
    var dateName = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.url(forResource: "holiday_2022", withExtension: "xml") {
            if let parser = XMLParser(contentsOf: path) {
                parser.delegate = self
                parser.parse()
            }
        }
        
        print(items[0].locdate)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMdd"
        print(dateFormatter.date(from: items[0].locdate))
        
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
}
