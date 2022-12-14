//
//  MovieListVC.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import UIKit
import Alamofire
import AlamofireImage
import SnapKit
import ESPullToRefresh

class MovieListVC: UIViewController {

    var moviePresenter:ViewToPresenterMovieProtocol?
    
    private let myTableView = UITableView()
    
    var arrayList: [Movie] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Movies"
        moviePresenter?.startFetchingMovie(paginate: false)
        showProgressIndicator(view: self.view)
//
        myTableView.register(MovieCell.self, forCellReuseIdentifier: "MovieCell")
        myTableView.delegate = self
        myTableView.dataSource = self
        
        view.backgroundColor = .white
        
        view.addSubview(myTableView)

        configureConstraints()
    }
    
    func configureConstraints(){
        myTableView.snp.makeConstraints { make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        }
    }
    

}

extension MovieListVC:PresenterToViewMovieProtocol{
    
    func onMovieResponseSuccess(movieModelArrayList: [Movie]) {
        self.arrayList.append(contentsOf: movieModelArrayList)
        self.myTableView.reloadData()
        hideProgressIndicator(view: self.view)
    }
    
    func onMovieResponseFailed(error: String) {
        
        hideProgressIndicator(view: self.view)
        let alert = UIAlertController(title: "Alert", message: "Problem Fetching Notice", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
        
    }
    
    
}

extension MovieListVC:UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayList.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath) as! MovieCell
        cell.movie = arrayList[indexPath.row]

        // this things should be done in interactor where the business logid is done and should be send back to viewController
//        Alamofire.request(self.arrayList[indexPath.row].!).responseData { (response) in
//            if response.error == nil {
//                print(response.result)
//                                if let data = response.data {
//                    cell.mImageView.image = UIImage(data: data)
//                }
//            }
//        }
        
        return cell
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let position = scrollView.contentOffset.y
        if position > (myTableView.contentSize.height-100-scrollView.frame.size.height) {
            // fetch more data
            moviePresenter?.startFetchingMovie(paginate: true)
        }
    }
    
}
