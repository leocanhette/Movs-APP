//
//  UIView+ActivityIndicator.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2020 Leonardo Canhette. All rights reserved.
//

import UIKit

extension UIView {    
    func loadActivity(){
        let lockView = UIView(frame: bounds)
        lockView.backgroundColor = UIColor(white: 0.0, alpha: 0.75)
        lockView.alpha = 0.0
        lockView.tag = 999
        
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.color = .white
        activityIndicator.hidesWhenStopped = true
        activityIndicator.center = lockView.center
        activityIndicator.startAnimating()
        
        addSubview(lockView)
        lockView.addSubview(activityIndicator, constraints: [
            activityIndicator.centerXAnchor.constraint(equalTo: centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
        
        UIView.animate(withDuration: 0.2) {
            lockView.alpha = 1.0
        }
    }
    
    func unloadActivity(){
        if let lockView = viewWithTag(999) {
            UIView.animate(withDuration: 0.2, animations: {
                lockView.alpha = 0.0
            }) { _ in
                lockView.removeFromSuperview()
            }
        }
    }
}
