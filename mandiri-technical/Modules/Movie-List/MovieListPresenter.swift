//
//  MovieListPresenter.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit

class MoviePresenter:ViewToPresenterMovieProtocol{
    
    var view: PresenterToViewMovieProtocol?
    
    var interactor: PresenterToInteractorMovieProtocol?
    
    var router: PresenterToRouterMovieProtocol?
    
    func startFetchingMovie() {
        interactor?.fetchMovie()
    }
    
    func showMovieDetailController(navigationController: UINavigationController, movie: Movie) {
        router?.pushToMovieDetail(navigationConroller: navigationController, movie: movie)
    }
    
}

extension MoviePresenter:InteractorToPresenterMovieProtocol{
    
    func movieFetchSuccess(movies: [Movie]) {
        view?.onMovieResponseSuccess(movies: movies)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error message from api response")
    }
    
    
}
