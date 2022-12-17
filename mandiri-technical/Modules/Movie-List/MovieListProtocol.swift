//
//  MovieListProtocol.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit

protocol ViewToPresenterMovieProtocol {
    
    var view: PresenterToViewMovieProtocol? {get set}
    var interactor: PresenterToInteractorMovieProtocol? {get set}
    var router: PresenterToRouterMovieProtocol? {get set}
    func startFetchingMovie()
    func showMovieDetailController(navigationController:UINavigationController, movie: Movie)
    
}

protocol PresenterToViewMovieProtocol {
    
    func onMovieResponseSuccess(movies: [Movie])
    func onMovieResponseFailed(error:String)
    
}

protocol PresenterToRouterMovieProtocol {
    
    static func createMovieModule(genreId: Int)->MovieListVC
    func pushToMovieDetail(navigationConroller: UINavigationController, movie: Movie)

}

protocol PresenterToInteractorMovieProtocol {
    
    var presenter:InteractorToPresenterMovieProtocol? {get set}
    var genreId:Int? {get set}
    func fetchMovie()
    
}

protocol InteractorToPresenterMovieProtocol {
    
    func movieFetchSuccess(movies: [Movie])
    func movieFetchFailed()
    
}
