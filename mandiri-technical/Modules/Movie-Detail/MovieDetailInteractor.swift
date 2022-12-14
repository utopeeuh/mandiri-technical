//
//  MovieDetailInteractor.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import Alamofire

class MovieDetailInteractor: PresenterToInteractorMovieDetailProtocol {
    
    var presenter: InteractorToPresenterMovieDetailProtocol?
    
    func fetchReviews(movie: Movie) {
        AF.request(API_MOVIE+"\(movie.id)/reviews?api_key=\(API_KEY)&language=en-US")
            .validate()
            .responseDecodable(of: ReviewResult.self) { response in
                guard let results = response.value else {
                    self.presenter?.reviewFetchFailed()
                    return
                }
                self.presenter?.reviewFetchSuccess(reviews: results.results)
          }
    }
    
    func fetchTrailer(movie: Movie) {
        
    }
}
