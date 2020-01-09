//
//  MovieSearchStateView.swift
//  Movs
//
//  Created by Leonardo Canhette on 07/01/20.
//  Copyright © 2020 Leonardo Canhette. All rights reserved.
//

import UIKit

final class MovieSearchViewStateView: UIView {
    
    private let messageImage: UIImageView =  ComponentsFactory.imageViewMake(contentMode: .scaleAspectFit)
    
    private let messageLabel: UILabel = ComponentsFactory.labelMake(fontSize: 20, weight: .bold, numberOfLines: 3, textAlignment: .center)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupLayout(){
        self.backgroundColor = .white
    }
    
    private func setupView(){
        self.addSubview(messageImage, constraints: [
            messageImage.widthAnchor.constraint(equalToConstant: 200),
            messageImage.heightAnchor.constraint(equalToConstant: 200),
            messageImage.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            messageImage.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -150)
        ])
        
        self.addSubview(messageLabel, constraints: [
            messageLabel.widthAnchor.constraint(equalToConstant: 300),
            messageLabel.topAnchor.constraint(equalToSystemSpacingBelow: messageImage.bottomAnchor, multiplier: 1),
            messageLabel.centerXAnchor.constraint(equalTo: messageImage.centerXAnchor)
        ])
    }
    
    // MARK: Function
    func update(with movieStateView: MovieSearchViewState){
        self.messageImage.image = movieStateView.imageView
        self.messageLabel.text = movieStateView.descriptionLabel
    }
    
}
