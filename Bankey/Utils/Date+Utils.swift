//
//  Date+Utils.swift
//  Bankey
//
//  Created by olivier geiger on 24/04/2024.
//

import UIKit

extension Date {
    static var projectDateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "fr_FR")
        return formatter
    }
    
    var dayMonthYearString: String {
        let dateFormatter = Date.projectDateFormatter
        dateFormatter.dateFormat = "d MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
