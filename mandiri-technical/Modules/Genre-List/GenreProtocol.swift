//
//  GenreProtocol.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 17/12/22.
//

import Foundation
import UIKit

protocol ViewToPresenterGenreProtocol {
    
    var view: PresenterToViewGenreProtocol? {get set}
    var interactor: PresenterToInteractorGenreProtocol? {get set}
    var router: PresenterToRouterGenreProtocol? {get set}
    func startFetchingGenre()
    func showMovieList(navigationController:UINavigationController, genreId: Int)
}

protocol PresenterToViewGenreProtocol {
    
    func onGenreResponseSuccess(genres: [Genre])
    func onGenreResponseFailed(error:String)
}

protocol PresenterToRouterGenreProtocol {
    
    static func createGenreModule()->GenreVC
    func pushToMovieList(navigationConroller: UINavigationController, genreId: Int)
}

protocol PresenterToInteractorGenreProtocol {
    
    var presenter:InteractorToPresenterGenreProtocol? {get set}
    func fetchGenres()
}

protocol InteractorToPresenterGenreProtocol {
    
    func genreFetchSuccess(genres: [Genre])
    func genreFetchFailed()
}
