//
//  MovieCell.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit
import SnapKit
import Kingfisher

class MovieCell: UITableViewCell {
    
    public var movie: Movie? {
        didSet{
            setupMovieInfo()
        }
    }
    
    let moviePoster : UIImageView = {
        let imageView = UIImageView()
        return imageView
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: "MovieCell")
        selectionStyle = .none
        backgroundColor = .white
        
        contentView.addSubview(moviePoster)
        
        configureConstraints()
    }
    
    func setupMovieInfo(){
        let url = URL(string: "https://image.tmdb.org/t/p/w500/\(movie!.posterPath)")
        moviePoster.kf.setImage(with: url)
    }
    
    func configureConstraints(){
        
        moviePoster.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.width.equalToSuperview().offset(-80)
            make.bottom.equalToSuperview().offset(-10)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
