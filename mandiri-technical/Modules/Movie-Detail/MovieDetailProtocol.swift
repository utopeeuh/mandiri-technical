//
//  MovieDetailProtocol.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit

protocol ViewToPresenterMovieDetailProtocol {
    
    var view: PresenterToViewMovieDetailProtocol? {get set}
    var interactor: PresenterToInteractorMovieDetailProtocol? {get set}
    var router: PresenterToRouterMovieDetailProtocol? {get set}
    func startFetchingReviews()
    func startFetchingTrailer()
}

protocol PresenterToViewMovieDetailProtocol {
    
    func onReviewsResponseSuccess(reviews: [Review])
    func onReviewsResponseFailed(error:String)
    
    func onTrailerResponseSuccess(trailer: Trailer?)
    func onTrailerResponseFailed(error:String)
    
}

protocol PresenterToRouterMovieDetailProtocol {
    
    static func createMovieDetailModule(movie: Movie)->MovieDetailVC
}

protocol PresenterToInteractorMovieDetailProtocol {
    
    var presenter:InteractorToPresenterMovieDetailProtocol? {get set}
    var movie:Movie? {get set}
    func fetchReviews()
    func fetchTrailer()
    
}

protocol InteractorToPresenterMovieDetailProtocol {
    
    func reviewFetchSuccess(reviews: [Review])
    func reviewFetchFailed()
    
    func trailerFetchSuccess(trailer: Trailer?)
    func trailerFetchFailed()
    
}
