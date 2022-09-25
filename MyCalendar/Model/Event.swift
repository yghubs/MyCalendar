//
//  Event.swift
//  MyCalendar
//
//  Created by 유재호 on 2022/09/13.
//

import Foundation

var eventsList = [Event]()


//let encoder = JSONEncoder()
//
///// encoded는 Data형
//if let encoded = try? encoder.encode(eventsList) {
//    UserDefaults.standard.setValue(encoded, forKey: "eventsList")
//}



class Event: Encodable
{
    var id: Int!
    var name: String!
    var date: Date!
    
    func eventsForDate(date: Date) -> [Event]
    {
        var daysEvents = [Event]()
        for event in eventsList
        {
            if(Calendar.current.isDate(event.date, inSameDayAs:date))
            {
                daysEvents.append(event)
            }
        }
        return daysEvents
    }
    
//    func eventsForDateAndTime(date: Date, hour: Int) -> [Event]
//    {
//        var daysEvents = [Event]()
//        for event in eventsList
//        {
//            if(Calendar.current.isDate(event.date, inSameDayAs:date))
//            {
//                let eventHour = CalendarHelper().hourFromDate(date: event.date)
//                if eventHour == hour
//                {
//                    daysEvents.append(event)
//                }
//            }
//        }
//        return daysEvents
//    }
}

