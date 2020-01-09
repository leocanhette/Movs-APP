//
//  MovieDetail.swift
//  Movs
//
//  Created by Leonardo Canhette on 05/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import UIKit

final class MovieDetailController: UIViewController {
    
    private let movieViewModel: MovieViewModel
    private lazy var movieDetailView = MovieDetailView(frame: self.view.frame)
    
    init(_ movieViewModel: MovieViewModel){
        self.movieViewModel = movieViewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        super.loadView()
        self.movieDetailView.prepareView(with: movieViewModel)
        self.view = movieDetailView        
    }    

}
