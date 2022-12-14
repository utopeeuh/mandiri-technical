//
//  MovieListVC.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import UIKit
import Alamofire
import AlamofireImage
import SnapKit
import ESPullToRefresh

class MovieListVC: UIViewController {

    var moviePresenter:ViewToPresenterMovieProtocol?
    
    private let movieTable = MovieTable()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Home"

        view.backgroundColor = .white
        navigationController?.navigationBar.prefersLargeTitles = true
        
        movieTable.delegate = self
        
        moviePresenter?.startFetchingMovie(paginate: false)
        showProgressIndicator(view: self.view)
        
        view.addSubview(movieTable)

        configureConstraints()
    }
    
    func configureConstraints(){
        movieTable.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension MovieListVC: MovieTableDelegate{
    func movieTable(clickedOn movie: Movie) {
        print(movie.title)
        moviePresenter?.showMovieDetailController(navigationController: navigationController!, movie: movie)
    }
    
    func movieTableHasReachedBottom() {
        moviePresenter?.startFetchingMovie(paginate: true)
    }
}

extension MovieListVC:PresenterToViewMovieProtocol{
    
    func onMovieResponseSuccess(movieModelArrayList: [Movie]) {
        movieTable.addToSource(movies: movieModelArrayList)
        hideProgressIndicator(view: self.view)
    }
    
    func onMovieResponseFailed(error: String) {
        
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
