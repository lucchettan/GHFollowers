//
//  UIViewController+Ext.swift
//  GitHub Followers
//
//  Created by mac on 14/09/2020.
//  Copyright © 2020 NLCompany. All rights reserved.
//

import UIKit
import SafariServices

extension UIViewController {
    
//    var containerView: UIView!
    
    func presentGFAlertOnMainThread(title: String, message: String, buttonTitle: String){
        DispatchQueue.main.async {
            let alertVC = GFAlertVC(title: title, message: message, buttonTitle: buttonTitle)
            alertVC.modalPresentationStyle = .overFullScreen
            alertVC.modalTransitionStyle = .crossDissolve
            self.present(alertVC, animated: true)
        }
    }
    
    func presentSafariVC(with url: URL){
        let safariVC = SFSafariViewController(url: url)
        safariVC.preferredControlTintColor = .systemGreen
        present(safariVC, animated:  true)
    }
}
