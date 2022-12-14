//
//  MovieListProtocol.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation

protocol ViewToPresenterMovieProtocol {
    
    var view: PresenterToViewMovieProtocol? {get set}
    var interactor: PresenterToInteractorMovieProtocol? {get set}
    var router: PresenterToRouterMovieProtocol? {get set}
    func startFetchingMovie(paginate: Bool)

}

protocol PresenterToViewMovieProtocol {
    
    func onMovieResponseSuccess(movieModelArrayList:Array<Movie>)
    func onMovieResponseFailed(error:String)
    
}

protocol PresenterToRouterMovieProtocol {
    
    static func createMovieModule()->MovieListVC

}

protocol PresenterToInteractorMovieProtocol {
    
    var presenter:InteractorToPresenterMovieProtocol? {get set}
    func fetchMovie(paginate: Bool)
    
}

protocol InteractorToPresenterMovieProtocol {
    
    func movieFetchSuccess(movieList:Array<Movie>)
    func movieFetchFailed()
    
}
