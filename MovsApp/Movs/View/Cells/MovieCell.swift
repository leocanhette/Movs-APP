//
//  MovieCell.swift
//  Movs
//
//  Created by Leonardo Canhette on 05/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class MovieCell: UICollectionViewCell, Reusable {
    
    private let coverImage: UIImageView = ComponentsFactory.imageViewMake(contentMode: .scaleToFill)
    private let titleLabel: UILabel = ComponentsFactory.labelMake(fontSize: 14, weight: .bold, numberOfLines: 0)
    private let favoriteButton: UIButton = UIButton()
    
    var movieViewModel: MovieViewModel?{
        didSet {
            self.titleLabel.text = movieViewModel?.title
            self.favoriteButton.setBackgroundImage(movieViewModel?.favoriteImageButton, for: .normal)
            self.coverImage.setImage(with: movieViewModel?.urlPosterPath)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
        self.setupLayout()        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupView(){
        addSubview(coverImage)
        addSubview(titleLabel)
        
        addSubview(favoriteButton, constraints: [
            favoriteButton.heightAnchor.constraint(equalToConstant: 25),
            favoriteButton.widthAnchor.constraint(equalToConstant: 25),
            favoriteButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
        ])
        
        // Horizontal Constraints
        addConstraintWithFormat("H:|[v0]|", views: coverImage)
        addConstraintWithFormat("H:|-6-[v0][v1]-10-|", views: titleLabel, favoriteButton)
        
        // Vertical Constraints
        addConstraintWithFormat("V:|[v0][v1(46)]|", views: coverImage, titleLabel)
    }
    
    private func setupLayout(){
        self.backgroundColor = R.color.backgroundCell()
        titleLabel.textColor = R.color.main()
    }
    
}
