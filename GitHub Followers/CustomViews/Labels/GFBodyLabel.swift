//
//  GFBodyLabel.swift
//  GitHub Followers
//
//  Created by mac on 14/09/2020.
//  Copyright © 2020 NLCompany. All rights reserved.
//

import UIKit

class GFBodyLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    convenience init(textAlignment: NSTextAlignment) {
        self.init(frame: .zero)
        self.textAlignment = textAlignment
    }
    
    private func configure(){
        textColor                                   = .secondaryLabel
        font                                        = UIFont.preferredFont(forTextStyle: .body)
        adjustsFontSizeToFitWidth                   = true
        minimumScaleFactor                          = 0.75
        
        //if username too long it will finish by "..."
        lineBreakMode                               = .byWordWrapping
        translatesAutoresizingMaskIntoConstraints   = false
    }
}
