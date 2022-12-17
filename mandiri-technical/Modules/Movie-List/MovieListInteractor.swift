//
//  MovieListInteractor.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import Alamofire

class MovieInteractor:PresenterToInteractorMovieProtocol{
    
    var presenter: InteractorToPresenterMovieProtocol?
    var genreId: Int?
    
    private var page: Int = 1
    
    func fetchMovie() {

        if genreId == nil {
            presenter?.movieFetchFailed()
            return
        }
        
        AF.request(APIString().movieListByGenre(genreId: genreId!, page: page))
            .validate()
            .responseDecodable(of: Result.self) { response in
                guard let results = response.value else {
                    self.presenter?.movieFetchFailed()
                    return
                }
                self.presenter?.movieFetchSuccess(movies: results.results)
          }
        
        page += 1
        if page > 500 {
            // api page limit is 500, revert back to first page
            page = 1
        }
        
    }
        
}
    
    
    
    
