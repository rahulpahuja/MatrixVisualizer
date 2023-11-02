//
//  UtilExtensions.swift
//  MV
//
//  Created by Rahul Pahuja on 08/10/23.
//

import Foundation

extension String {
    func toDate(withFormat format: String = "yyyyMMddhh")-> Date?{
        let dateFormatter = DateFormatter()
        dateFormatter.timeZone = TimeZone(identifier: "Asia/Tehran")
        dateFormatter.locale = Locale(identifier: "fa-IR")
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.dateFormat = format
        let date = dateFormatter.date(from: self)
        return date
    }
}



extension Date{
    var day:Int {
        let calendar = Calendar.current
        let c =  calendar.dateComponents([.year, .month, .day, .hour], from: self)
        return c.day ?? 0
    }
}

extension Int{
    var thString:String{
        var date = String(self)
        if self>10 && self < 14{
            date += "th"
            return date
        }
        let num = self % 10
        switch(num){
            case 1 : date += "st"
            case 2: date += "nd"
            case 3: date += "rd"
            default: date += "th"
        }
        return date
    }
}
