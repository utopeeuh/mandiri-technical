//
//  Constants.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation

class APIString {
    
    private let baseUrl = "https://api.themoviedb.org/3"
    private let key = "?api_key=56026102844ede6f815a58f0c3161603"
    private let lang = "&language=en-US"
    
    public func genres() -> String{
        return baseUrl+"/genre/movie/list"+key+lang
    }
    
    public func movieListByGenre(genreId: Int, page: Int) -> String{
        return baseUrl+"/discover/movie"+key+"&sort_by=popularity.desc&page\(page)&with_genres=\(genreId)"
    }
    
    public func reviews(movieId: Int) -> String {
        return baseUrl+"/movie/\(movieId)/reviews"+key
    }
    
    public func trailer(movieId:Int) -> String {
        return baseUrl+"/movie/\(movieId)/videos"+key
    }
}
