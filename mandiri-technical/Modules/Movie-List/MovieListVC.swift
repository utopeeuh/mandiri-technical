//
//  MovieListVC.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import UIKit
import Alamofire
import SnapKit

class MovieListVC: UIViewController {

    var moviePresenter:ViewToPresenterMovieProtocol?
    
    private let movieTable = MovieTable()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Movies"

        view.backgroundColor = .white
        
        movieTable.delegate = self
        
        moviePresenter?.startFetchingMovie()
        showProgressIndicator(view: self.view)
        
        view.addSubview(movieTable)

        configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureConstraints(){
        movieTable.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
}

extension MovieListVC: MovieTableDelegate{
    func movieTable(clickedOn movie: Movie) {
        moviePresenter?.showMovieDetailController(navigationController: navigationController!, movie: movie)
    }
    
    func movieTableHasReachedBottom() {
        moviePresenter?.startFetchingMovie()
    }
}

extension MovieListVC:PresenterToViewMovieProtocol{
    
    func onMovieResponseSuccess(movies: [Movie]) {
        movieTable.addToSource(movies: movies)
        hideProgressIndicator(view: self.view)
    }
    
    func onMovieResponseFailed(error: String) {
        
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem fetching movies", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
}
