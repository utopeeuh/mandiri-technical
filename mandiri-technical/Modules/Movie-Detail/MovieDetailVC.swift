//
//  MovieDetailVC.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit
import SnapKit
import YoutubePlayerView

class MovieDetailVC: UIViewController {
    
    var movie: Movie!
    
    var movieDetailPresenter:ViewToPresenterMovieDetailProtocol?
    
    let youtubePlayer : YoutubePlayerView = {
        let player = YoutubePlayerView(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width-40, height: (UIScreen.main.bounds.width-40)*9/16))
        player.alpha = 0
        return player
    }()
    
    let playerPlaceholder : UIView = {
        let view = UIView()
        view.backgroundColor = .black
        return view
    }()
    
    let noVideoView = NoVideoView()
    
    var detailSegment : MovieDetailSegment!
    
    let reviewTable : ReviewTable = {
        let table = ReviewTable()
        table.alpha = 0
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        title = "Movie Detail"
        navigationController?.navigationBar.prefersLargeTitles = false
        
        youtubePlayer.delegate = self
        
        detailSegment = MovieDetailSegment(movie: movie)
        
        reviewTable.delegate = self
        
        movieDetailPresenter?.startFetchingReviews()
        movieDetailPresenter?.startFetchingTrailer()
        
        view.addSubview(playerPlaceholder)
        view.addSubview(noVideoView)
        view.addSubview(youtubePlayer)
        view.addSubview(detailSegment)
        view.addSubview(reviewTable)
        
        configureConstraints()
    }
    
    func configureConstraints(){
        youtubePlayer.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide)
            make.centerX.equalToSuperview()
            make.size.equalTo(youtubePlayer.frame.size)
        }
        
        playerPlaceholder.snp.makeConstraints { make in
            make.center.edges.equalTo(youtubePlayer)
        }
        
        noVideoView.snp.makeConstraints { make in
            make.center.edges.equalTo(youtubePlayer)
        }
        
        detailSegment.snp.makeConstraints { make in
            make.top.equalTo(playerPlaceholder.snp.bottom).offset(20)
            make.width.equalToSuperview().offset(-40)
            make.centerX.equalToSuperview()
        }
        
        reviewTable.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(detailSegment.snp.bottom).offset(16)
            make.width.equalToSuperview().offset(-40)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
    }
    
}

extension MovieDetailVC:PresenterToViewMovieDetailProtocol {
    func onReviewsResponseSuccess(reviews: [Review]) {
        if reviews.isEmpty {
            return
        }
        
        reviewTable.addToSource(reviews: reviews)
        UIView.animate(withDuration: 0.2) {
            self.reviewTable.alpha = 1
        }
    }
    
    func onReviewsResponseFailed(error: String) {
        print(error)
        let alert = UIAlertController(title: "Alert", message: "Problem fetching revies", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
    func onTrailerResponseSuccess(trailer: Trailer?) {
        if trailer != nil{
            youtubePlayer.loadWithVideoId(trailer!.key)
        }
    }
    
    func onTrailerResponseFailed(error: String) {
        print(error)
    }
}

extension MovieDetailVC: ReviewTableDelegate {
    func reviewTableHasReachedBottom() {
        movieDetailPresenter?.startFetchingReviews()
    }
}

extension MovieDetailVC: YoutubePlayerViewDelegate{
    func playerViewDidBecomeReady(_ playerView: YoutubePlayerView) {
        // Fade in when video is ready
        UIView.animate(withDuration: 0.2) {
            playerView.alpha = 1
        }
    }
    
    func playerView(_ playerView: YoutubePlayerView, receivedError error: Error) {
        // Handle video error
        print("Error: \(error)")
        noVideoView.show()
    }
}
