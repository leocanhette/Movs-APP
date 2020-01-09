//
//  MovieCollectionView.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class MovieCollectionView: UIView {
    
    private let searchBar: UISearchBar
    private let collectionView: UICollectionView
    private let searchStateView: MovieSearchViewStateView
    private lazy var stackView: UIStackView = UIStackView(arrangedSubviews: [self.collectionView, self.searchStateView])
    
    init(_ frame: CGRect, searchBar: UISearchBar, collectionView: UICollectionView, searchStateView: MovieSearchViewStateView) {
        self.searchBar = searchBar
        self.collectionView = collectionView
        self.searchStateView = searchStateView
        super.init(frame: frame)
        self.setupLayout()
        self.setupView()        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func setupLayout(){
        self.stackView.axis = .vertical
        self.collectionView.backgroundColor = .white
        self.collectionView.showsVerticalScrollIndicator = false
        let flowLayout = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flowLayout.sectionInset = UIEdgeInsets(top: 8, left: 8, bottom: 0, right: 8)
        self.setupSearchBar()
    }
    
    private func setupSearchBar(){
        self.searchBar.placeholder = R.string.common.searchBarPlaceholder()
        self.searchBar.barTintColor = R.color.main()
        self.searchBar.tintColor = .black
        self.searchBar.showsCancelButton = true
    }
    
    private func setupView(){
        addSubview(searchBar, constraints: [
            searchBar.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor),
            searchBar.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            searchBar.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
        
        addSubview(stackView, constraints: [
            stackView.topAnchor.constraint(equalTo: searchBar.bottomAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            stackView.leadingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: self.safeAreaLayoutGuide.trailingAnchor)
        ])
    }
    
}
