//
//  MovieListPresenter.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation

class MoviePresenter:ViewToPresenterMovieProtocol{
    
    var view: PresenterToViewMovieProtocol?
    
    var interactor: PresenterToInteractorMovieProtocol?
    
    var router: PresenterToRouterMovieProtocol?
    
    func startFetchingMovie(paginate: Bool) {
        interactor?.fetchMovie(paginate: paginate)
    }
    
}

extension MoviePresenter:InteractorToPresenterMovieProtocol{
    
    func movieFetchSuccess(movieList: [Movie]) {
        view?.onMovieResponseSuccess(movieModelArrayList: movieList)
    }
    
    func movieFetchFailed() {
        view?.onMovieResponseFailed(error: "Some Error message from api response")
    }
    
    
}
