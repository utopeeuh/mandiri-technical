//
//  GenrePresenter.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 17/12/22.
//

import Foundation
import UIKit

class GenrePresenter:ViewToPresenterGenreProtocol{
    
    var view: PresenterToViewGenreProtocol?
    
    var interactor: PresenterToInteractorGenreProtocol?
    
    var router: PresenterToRouterGenreProtocol?
    
    func startFetchingGenre() {
        interactor?.fetchGenres()
    }
    
    func showMovieList(navigationController: UINavigationController, genreId: Int) {
        router?.pushToMovieList(navigationConroller: navigationController, genreId: genreId)
    }
}

extension GenrePresenter:InteractorToPresenterGenreProtocol{
    
    func genreFetchSuccess(genres: [Genre]) {
        view?.onGenreResponseSuccess(genres: genres)
    }
    
    func genreFetchFailed() {
        view?.onGenreResponseFailed(error: "Some Error message from api response")
    }
    
    
}
