//
//  MovieDetailRouter.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit

class MovieDetailRouter:PresenterToRouterMovieDetailProtocol{
    
    static func createMovieDetailModule(movie: Movie) -> MovieDetailVC {
        
        let view = MovieDetailVC()
        
        var presenter: ViewToPresenterMovieDetailProtocol & InteractorToPresenterMovieDetailProtocol = MovieDetailPresenter()
        var interactor: PresenterToInteractorMovieDetailProtocol = MovieDetailInteractor()
        let router:PresenterToRouterMovieDetailProtocol = MovieDetailRouter()
        
        view.movie = movie
        view.movieDetailPresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
}
