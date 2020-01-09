//
//  ComponentsFactory.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class ComponentsFactory {
    
    static func labelMake<T: UILabel>(fontSize: CGFloat, weight: UIFont.Weight, numberOfLines: Int = 1, textAlignment: NSTextAlignment = .left) -> T {
        let label = T()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        label.numberOfLines = numberOfLines
        label.textAlignment = textAlignment
        label.lineBreakMode = .byWordWrapping
        return label
    }
    
    static func imageViewMake<T: UIImageView>(contentMode: T.ContentMode) -> T {
        let imageView = T()
        imageView.clipsToBounds = true
        imageView.contentMode = contentMode
        return imageView
    }
    
}
