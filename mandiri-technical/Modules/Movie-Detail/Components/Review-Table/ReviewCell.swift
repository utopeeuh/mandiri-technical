//
//  ReviewCell.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 15/12/22.
//

import Foundation
import UIKit
import SnapKit

class ReviewCell: UITableViewCell {
    
    public var review: Review? {
        didSet{
            setupLabels()
        }
    }
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = .systemGray
        return label
    }()
    
    let reviewText: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14)
        label.lineBreakMode = .byWordWrapping
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value1, reuseIdentifier: "ReviewCell")
        backgroundColor = .white
    }
    
    func setupLabels(){
        authorLabel.text = review?.author
        authorLabel.sizeToFit()
        
        reviewText.text = review?.content
        reviewText.sizeToFit()
        
        addSubview(authorLabel)
        addSubview(reviewText)
        
        configureConstraints()
    }
    
    func configureConstraints(){
        authorLabel.snp.makeConstraints { make in
            make.width.equalToSuperview()
            make.top.equalToSuperview().offset(8)
        }
        
        reviewText.snp.makeConstraints { make in
            make.top.equalTo(authorLabel.snp.bottom).offset(8)
            make.width.equalToSuperview()
            make.bottom.equalToSuperview().offset(-8)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
