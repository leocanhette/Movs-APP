//
//  MovieAPI.swift
//  Movs
//
//  Created by Leonardo Canhette on 04/01/20.
//  Copyright © 2019 Leonardo Canhette. All rights reserved.
//

import Alamofire

final class MovieAPI: ServiceAPI {
    
    static let shared = MovieAPI()
    private init() {}
    
    private func createUrlRequestMovies(_ titleFiltering: String?, page: Int) -> String {
        var urlAPI: String
        if let titleFiltering = titleFiltering, !titleFiltering.isEmpty {
            urlAPI = "\(R.string.apI.basePathRequesthMovieByName())&api_key=\(R.string.apI.apiKey())&page=\(page)&query=\(titleFiltering)"
        }else {
            urlAPI = "\(R.string.apI.basePathRequestMovie())&api_key=\(R.string.apI.apiKey())&page=\(page)"
        }
        return urlAPI
    }
    
    func fetchMovies(_ titleFiltering: String?, page: Int, completion: @escaping (Result<MovieInfo, Error>) -> Void){
        AF.request(self.createUrlRequestMovies(titleFiltering, page: page)).responseJSON { (response) in
            
            guard let data = response.data else {
                completion(.failure(EmptyError.emptySearch))
                return
            }
            
            do {
                let movieInfo = try JSONDecoder().decode(MovieInfo.self, from: data)
                
                if movieInfo.results.count > 0 {
                    completion(.success(movieInfo))
                }else {
                    if let titleFiltered = titleFiltering {
                        completion(.failure(EmptyError.emptySearchWitlTitleFiltered(titleFiltered)))
                    }else {
                        completion(.failure(EmptyError.emptySearch))
                    }
                }
            } catch let JSONError {                
                guard let dataResultErro = try? JSONDecoder().decode(DataResultErro.self, from: data) else {
                    completion(.failure(ApiError.decodeData(localizedDescription: JSONError.localizedDescription)))
                    return
                }
                completion(.failure(ApiError.requestMovie(localizedDescription: dataResultErro.statusMessage)))
            }
        }
    }
    
}
