//
//  MovieTable.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit
import SnapKit

protocol MovieTableDelegate {
    func movieTable(clickedOn movie: Movie)
    
    func movieTableHasReachedBottom()
}

class MovieTable: UIView {
    
    
    public var delegate: MovieTableDelegate?
    
    private var source: [Movie] = []
    
    private let movieTableView = UITableView()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        movieTableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        movieTableView.delegate = self
        movieTableView.dataSource = self
        
        addSubview(movieTableView)
        
        movieTableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func addToSource(movies: [Movie]) {
        self.source.append(contentsOf: movies)
        self.movieTableView.reloadData()
    }
    
}

extension MovieTable: UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return source.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movie = source[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        movieTableView.deselectRow(at: indexPath, animated: true)
        delegate?.movieTable(clickedOn: source[indexPath.row])
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (movieTableView.contentSize.height-100-scrollView.frame.size.height) {
            
            // fetch more data
            delegate?.movieTableHasReachedBottom()
        }
    }
}
