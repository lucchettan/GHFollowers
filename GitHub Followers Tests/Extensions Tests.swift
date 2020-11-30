//
//  Extensions Tests.swift
//  GitHub Followers Tests
//
//  Created by mac on 30/11/2020.
//  Copyright © 2020 NLCompany. All rights reserved.
//
@testable import GitHub_Followers

import XCTest

class Extensions_Tests: XCTestCase {
    
    func test_date_converter() throws {
        let date = Date().convertToMonthYearFormat()
        XCTAssertEqual(date, "Nov 2020")
    }
}
