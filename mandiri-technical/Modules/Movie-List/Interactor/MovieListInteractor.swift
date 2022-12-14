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
    
    private var page: Int = 1
    private var isPaginating = false
    
    func fetchMovie(paginate: Bool) {
        if paginate {
            if page == 500 {
                // api page limit is 500, revert back to first page
                page = 1
            }
            else{
                page += 1
            }
            
            isPaginating = true
        }
        
        else {
            page = 1
        }
        
        AF.request(API_MOVIE_LIST+"&page=\(page)")
            .validate()
            .responseDecodable(of: Result.self) { response in
                guard let results = response.value else {
                    self.presenter?.movieFetchFailed()
                    return
                }
                self.presenter?.movieFetchSuccess(movieList: results.results)
          }
        
        if paginate {
            isPaginating = false
        }
        
    }
        
}
    
    
    
    
