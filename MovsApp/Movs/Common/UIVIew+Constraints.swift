//
//  UIVIew+Constraints.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

extension UIView {
    func addConstraintWithFormat<T: UIView>(_ format: String, views: T...){
        var mViews: [String:T] = [:]
        for(index,view) in views.enumerated(){
            view.translatesAutoresizingMaskIntoConstraints = false
            mViews["v\(index)"] = view
        }
        addConstraints(NSLayoutConstraint.constraints(withVisualFormat: format,
                                                      options: NSLayoutConstraint.FormatOptions(),
                                                      metrics: nil, views: mViews))
    }
    
    func addSubview<T: UIView>(_ view: T, constraints: [NSLayoutConstraint]){
        addSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
}
