//
//  MovieCell.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit
import SnapKit

class MovieCell: UITableViewCell {
    
    public var movie: Movie? {
        didSet{
            titleLabel.text = movie?.title
            titleLabel.sizeToFit()
        }
    }
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: "MovieCell")
        
        backgroundColor = .white
        
        addSubview(titleLabel)
        
        configureConstraints()
    }
    
    func configureConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.center.height.equalToSuperview()
            make.width.equalToSuperview().offset(-20)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
