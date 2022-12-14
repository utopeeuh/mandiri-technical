//
//  MovieListRouter.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit

class MovieRouter:PresenterToRouterMovieProtocol{
    
    static func createMovieModule() -> MovieListVC {
        
        let view = MovieListVC()
        
        var presenter: ViewToPresenterMovieProtocol & InteractorToPresenterMovieProtocol = MoviePresenter()
        var interactor: PresenterToInteractorMovieProtocol = MovieInteractor()
        let router:PresenterToRouterMovieProtocol = MovieRouter()
        
        view.moviePresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
        
    }
    
    func pushToMovieDetail(navigationConroller navigationController:UINavigationController, movie: Movie) {
        
        let detailModule = MovieDetailRouter.createMovieDetailModule(movie: movie)
        
        navigationController.pushViewController(detailModule,animated: true)
    }
    
}
