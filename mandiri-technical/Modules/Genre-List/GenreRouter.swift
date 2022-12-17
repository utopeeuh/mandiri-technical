//
//  GenreRouter.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 17/12/22.
//

import Foundation
import UIKit

class GenreRouter:PresenterToRouterGenreProtocol{
    
    static func createGenreModule() -> GenreVC {
        
        let view = GenreVC()
        
        var presenter: ViewToPresenterGenreProtocol & InteractorToPresenterGenreProtocol = GenrePresenter()
        var interactor: PresenterToInteractorGenreProtocol = GenreInteractor()
        let router:PresenterToRouterGenreProtocol = GenreRouter()
        
        view.genrePresenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        
        return view
    }
    
    func pushToMovieList(navigationConroller navigationController:UINavigationController, genreId: Int) {
        
        let detailModule = MovieRouter.createMovieModule(genreId: genreId)
        
        navigationController.pushViewController(detailModule,animated: true)
    }
    
    
}
