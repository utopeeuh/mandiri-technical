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
    
    func startFetchingReviews() {
        interactor?.fetchReviews()
    }
    
    func startFetchingTrailer() {
        interactor?.fetchTrailer()
    }
}

extension MovieDetailPresenter:InteractorToPresenterMovieDetailProtocol{
    
    func reviewFetchSuccess(reviews: [Review]) {
        view?.onReviewsResponseSuccess(reviews: reviews)
    }
    
    func reviewFetchFailed() {
        
    }
    
    func trailerFetchSuccess(trailer: Trailer?) {
        view?.onTrailerResponseSuccess(trailer: trailer)
    }
    
    func trailerFetchFailed() {
        
    }
}
