//
//  ReviewTable.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 15/12/22.
//

import Foundation
import UIKit
import SnapKit

protocol ReviewTableDelegate {
    func reviewTableHasReachedBottom()
}

class ReviewTable: UIView {
    
    public var delegate: ReviewTableDelegate?
    
    private var source: [Review] = []
    
    private let reviewLabel : UILabel = {
        let label = UILabel()
        label.text = "Reviews"
        label.font = .systemFont(ofSize: 18, weight: .bold)
        return label
    }()
    
    private let reviewTableView : UITableView = {
        let table = UITableView()
        table.allowsSelection = false
        table.separatorStyle = .none
        table.register(ReviewCell.self, forCellReuseIdentifier: "ReviewCell")
        table.estimatedRowHeight = 100
        table.rowHeight = UITableView.automaticDimension
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        reviewTableView.delegate = self
        reviewTableView.dataSource = self
        
        addSubview(reviewLabel)
        addSubview(reviewTableView)
        
        configureConstraints()
    }
    
    func configureConstraints(){
        reviewLabel.snp.makeConstraints { make in
            make.top.width.equalToSuperview()
        }
        
        reviewTableView.snp.makeConstraints { make in
            make.top.equalTo(reviewLabel.snp.bottom).offset(8)
            make.bottom.width.equalToSuperview()
        }
    }
    
    func addToSource(reviews: [Review]) {
        self.source.append(contentsOf: reviews)
        self.reviewTableView.reloadData()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ReviewTable: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewCell
        cell.review = source[indexPath.row]
        
        return cell
    }
  
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (reviewTableView.contentSize.height-100-scrollView.frame.size.height) {
            
            // fetch more data
            delegate?.reviewTableHasReachedBottom()
        }
    }
}
