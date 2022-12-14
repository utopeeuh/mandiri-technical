//
//  MovieDetailPresenter.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation

class MovieDetailPresenter:ViewToPresenterMovieDetailProtocol{
    var view: PresenterToViewMovieDetailProtocol?
    
    var interactor: PresenterToInteractorMovieDetailProtocol?
    
    var router: PresenterToRouterMovieDetailProtocol?
    
    func startFetchingReviews(movie: Movie) {
        interactor?.fetchReviews(movie: movie)
    }
    
    func startFetchingTrailer(movie: Movie) {
        
    }
}

extension MovieDetailPresenter:InteractorToPresenterMovieDetailProtocol{
    
    func reviewFetchSuccess(reviews: [Review]) {
        view?.onReviewsResponseSuccess(reviews: reviews)
    }
    
    func reviewFetchFailed() {
        
    }
    
    func trailerFetchSuccess(trailer: Trailer) {
        
    }
    
    func trailerFetchFailed() {
        
    }
}
