//
//  Date+Ext.swift
//  GHFollowers
//
//  Created by Vitor Bukovitz on 3/12/21.
//

import Foundation

extension Date {
    
    func convertToMonthYearFormat() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
}
