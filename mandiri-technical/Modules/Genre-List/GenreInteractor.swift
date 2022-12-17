//
//  GenreInteractor.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 17/12/22.
//

import Foundation
import Alamofire

class GenreInteractor: PresenterToInteractorGenreProtocol {
    
    var presenter: InteractorToPresenterGenreProtocol?
    
    func fetchGenres() {
        AF.request(APIString().genres())
            .validate()
            .responseDecodable(of: GenreResult.self) { response in
                guard let results = response.value else {
                    self.presenter?.genreFetchFailed()
                    return
                }
                self.presenter?.genreFetchSuccess(genres: results.genres)
          }
    }
}
