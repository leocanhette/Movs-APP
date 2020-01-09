//
//  MovieDetailView.swift
//  Movs
//
//  Created by Leonardo Canhette on 05/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class MovieDetailView: UIView {
    
    private let coverImageStackView: UIStackView = UIStackView(arrangedSubviews: [])
    
    private let coverImage: UIImageView = ComponentsFactory.imageViewMake(contentMode: .scaleToFill)
    
    private let titleLabel: UILabel = ComponentsFactory.labelMake(fontSize: 21, weight: .bold, numberOfLines: 2)
    
    private let releaseDateLabel: UILabel = ComponentsFactory.labelMake(fontSize: 16, weight: .regular)
    
    private let genreLabel: UILabel = ComponentsFactory.labelMake(fontSize: 16, weight: .regular)
    
    private let overviewLabel: UILabel = ComponentsFactory.labelMake(fontSize: 16, weight: .regular, numberOfLines: 0)
    
    private let favoriteButton = UIButton()
    
    private let lineViewTitle = UIView()
    
    private let lineViewGenre = UIView()
    
    private let lineViewReleaseDate = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupLayout()
        self.setupView()        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func prepareView(with movieViewModel: MovieViewModel){
        self.titleLabel.text = movieViewModel.title
        self.favoriteButton.setBackgroundImage(movieViewModel.favoriteImageButton, for: .normal)
        self.releaseDateLabel.text = movieViewModel.releaseDate
        self.genreLabel.text = movieViewModel.genre
        self.overviewLabel.text = movieViewModel.overview
        self.coverImage.setImage(with: movieViewModel.urlPosterPath)
    }
    
    private func setupLayout(){
        self.backgroundColor = .white
        self.lineViewTitle.backgroundColor = .systemGray
        self.lineViewReleaseDate.backgroundColor = .systemGray
        self.lineViewGenre.backgroundColor = .systemGray
    }
    
    private func setupView(){
        
        self.addSubview(coverImageStackView, constraints: [
            coverImageStackView.heightAnchor.constraint(equalTo: self.safeAreaLayoutGuide.heightAnchor, multiplier: 0.55),
            coverImageStackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            coverImageStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            coverImageStackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        self.coverImageStackView.addSubview(coverImage, constraints: [
            coverImage.leadingAnchor.constraint(equalTo: coverImageStackView.leadingAnchor, constant: 20),
            coverImage.topAnchor.constraint(equalTo: coverImageStackView.topAnchor, constant: 20),
            coverImage.trailingAnchor.constraint(equalTo: coverImageStackView.trailingAnchor, constant: -20),
            coverImage.bottomAnchor.constraint(equalTo: coverImageStackView.bottomAnchor, constant: -5)
        ])
        
        self.addSubview(titleLabel, constraints: [
            titleLabel.topAnchor.constraint(equalTo: coverImageStackView.bottomAnchor, constant: 10),
            titleLabel.leadingAnchor.constraint(equalTo: coverImageStackView.leadingAnchor, constant: 30),
            titleLabel.trailingAnchor.constraint(equalTo: coverImageStackView.trailingAnchor, constant: -75)
        ])
        
        self.addSubview(favoriteButton, constraints: [
            favoriteButton.heightAnchor.constraint(equalToConstant: 35),
            favoriteButton.widthAnchor.constraint(equalToConstant: 35),
            favoriteButton.centerYAnchor.constraint(equalTo: titleLabel.centerYAnchor),
            favoriteButton.trailingAnchor.constraint(equalTo: coverImageStackView.trailingAnchor, constant: -30)
        ])
        
        self.addSubview(lineViewTitle, constraints: [
            lineViewTitle.heightAnchor.constraint(equalToConstant: 0.5),
            lineViewTitle.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor, constant: 20),
            lineViewTitle.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            lineViewTitle.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor, constant: -20)
        ])
        
        self.addSubview(releaseDateLabel, constraints: [
            releaseDateLabel.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            releaseDateLabel.topAnchor.constraint(equalTo: lineViewTitle.bottomAnchor, constant: 10),
            releaseDateLabel.trailingAnchor.constraint(equalTo: favoriteButton.trailingAnchor)
        ])
        
        self.addSubview(lineViewReleaseDate, constraints: [
            lineViewReleaseDate.heightAnchor.constraint(equalTo: lineViewTitle.heightAnchor),
            lineViewReleaseDate.leadingAnchor.constraint(equalTo: lineViewTitle.leadingAnchor),
            lineViewReleaseDate.topAnchor.constraint(equalTo: releaseDateLabel.bottomAnchor, constant: 10),
            lineViewReleaseDate.trailingAnchor.constraint(equalTo: lineViewTitle.trailingAnchor)
        ])
        
        self.addSubview(genreLabel, constraints: [
            genreLabel.leadingAnchor.constraint(equalTo: releaseDateLabel.leadingAnchor),
            genreLabel.topAnchor.constraint(equalTo: lineViewReleaseDate.bottomAnchor, constant: 10),
            genreLabel.trailingAnchor.constraint(equalTo: releaseDateLabel.trailingAnchor)
        ])
        
        self.addSubview(lineViewGenre, constraints: [
            lineViewGenre.heightAnchor.constraint(equalTo: lineViewTitle.heightAnchor),
            lineViewGenre.leadingAnchor.constraint(equalTo: lineViewTitle.leadingAnchor),
            lineViewGenre.topAnchor.constraint(equalTo: genreLabel.bottomAnchor, constant: 10),
            lineViewGenre.trailingAnchor.constraint(equalTo: lineViewTitle.trailingAnchor)
        ])
        
        self.addSubview(overviewLabel, constraints: [
            overviewLabel.leadingAnchor.constraint(equalTo: releaseDateLabel.leadingAnchor),
            overviewLabel.topAnchor.constraint(equalTo: lineViewGenre.bottomAnchor, constant: 10),
            overviewLabel.trailingAnchor.constraint(equalTo: releaseDateLabel.trailingAnchor),
            overviewLabel.bottomAnchor.constraint(lessThanOrEqualTo: self.safeAreaLayoutGuide.bottomAnchor, constant: -10)
        ])
    }
    
}
