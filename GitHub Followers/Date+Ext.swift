//
//  Date+Ext.swift
//  GitHub Followers
//
//  Created by mac on 21/09/2020.
//  Copyright © 2020 NLCompany. All rights reserved.
//

import Foundation

extension Date {
    // take a Date object and give back the string at the format we want
    func convertToMonthYearFormat() -> String {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "MMM yyyy"
        return dateFormatter.string(from: self)
    }
    
}
