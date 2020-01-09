//
//  UIImageView+Kingfisher.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2020 Leonardo Canhette. All rights reserved.
//

import UIKit
import Kingfisher

extension UIImageView {
    func setImage(with urlImage: URL?){
        self.kf.indicatorType = .activity
        self.kf.setImage(with: urlImage,
                         placeholder: R.image.noImage()
        )
    }
}
