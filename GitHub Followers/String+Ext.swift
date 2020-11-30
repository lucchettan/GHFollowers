//
//  String+Ext.swift
//  GitHub Followers
//
//  Created by mac on 21/09/2020.
//  Copyright © 2020 NLCompany. All rights reserved.
//

import Foundation

extension String {
    func convertToDate() -> Date? {
        let dateFormatter           = DateFormatter()
        dateFormatter.dateFormat    = "yyyy-MM-DD'T'HH:mm:ssZ"
        dateFormatter.locale        = Locale(identifier: "fr_FR")
        dateFormatter.timeZone      = .current
        return dateFormatter.date(from: self)
    }
    
    func convertToDisplayFormat() -> String {
        guard let date = self.convertToDate() else { return "N/A" }
        
        return date.convertToMonthYearFormat()
    }
}
