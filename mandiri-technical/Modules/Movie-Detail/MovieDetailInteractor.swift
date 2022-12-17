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
    var movie: Movie?
    
    var isCalled = false
    func fetchReviews() {
        
        if movie == nil {
            presenter?.trailerFetchFailed()
            return
        }
        
        AF.request(APIString().reviews(movieId: movie!.id))
            .validate()
            .responseDecodable(of: ReviewResult.self) { response in
                guard let results = response.value else {
                    self.presenter?.reviewFetchFailed()
                    return
                }
                self.presenter?.reviewFetchSuccess(reviews: results.results)
          }
    }
    
    func fetchTrailer() {
        
        if movie == nil {
            presenter?.trailerFetchFailed()
            return
        }
        
        AF.request(APIString().trailer(movieId: movie!.id))
            .validate()
            .responseDecodable(of: TrailerResult.self) { response in
                guard let results = response.value else {
                    self.presenter?.trailerFetchFailed()
                    return
                }
                self.presenter?.trailerFetchSuccess(trailer: results.results.first(where: {$0.site == "YouTube"}))
          }
    }
}
