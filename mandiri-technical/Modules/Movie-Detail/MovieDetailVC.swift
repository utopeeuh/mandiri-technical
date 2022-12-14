//
//  MovieDetailVC.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit
import SnapKit

class MovieDetailVC: UIViewController {
    
    var movie: Movie!
    
    var movieDetailPresenter:ViewToPresenterMovieDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .yellow
        
        title = movie.title
        navigationController?.navigationBar.prefersLargeTitles = false
        
        movieDetailPresenter?.startFetchingReviews(movie: movie)
        
    }
}

extension MovieDetailVC:PresenterToViewMovieDetailProtocol {
    func onReviewsResponseSuccess(reviews: [Review]) {
        print(reviews)
    }
    
    func onReviewsResponseFailed(error: String) {
        print(error)
    }
    
    func onTrailerResponseSuccess(trailer: Trailer) {
        print(trailer)
    }
    
    func onTrailerResponseFailed(error: String) {
        print(error)
    }
}
