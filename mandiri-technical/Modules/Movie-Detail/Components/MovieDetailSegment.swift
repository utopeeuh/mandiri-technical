//
//  MovieDetailSegment.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 15/12/22.
//

import Foundation
import UIKit
import SnapKit

class MovieDetailSegment: UIView {
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 24, weight: .bold)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let descLabel : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let releaseDate : UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    let labelStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 8
        return stack
    }()
    
    required init(movie: Movie){
        super.init(frame: .zero)
        
        titleLabel.text = movie.title
        descLabel.text = movie.overview
        releaseDate.text = "Release date: \(movie.releaseDate)"
        
        labelStack.addArrangedSubview(titleLabel)
        labelStack.addArrangedSubview(descLabel)
        labelStack.addArrangedSubview(releaseDate)
        
        addSubview(labelStack)
        configureConstraints()
    }
    
    func configureConstraints(){
        labelStack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }    
    
}
