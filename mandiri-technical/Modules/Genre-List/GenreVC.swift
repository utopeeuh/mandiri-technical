//
//  GenreVC.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 17/12/22.
//
import UIKit
import Alamofire
import SnapKit

class GenreVC: UIViewController {

    var genrePresenter:ViewToPresenterGenreProtocol?
    
    var source : [Genre] = []
    
    let genreTableView : UITableView = {
        let tableView = UITableView()
        tableView.rowHeight = 50
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "GenreCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Genres"

        view.backgroundColor = .white
        
        genreTableView.dataSource = self
        genreTableView.delegate = self
        
        genrePresenter?.startFetchingGenre()
        
        view.addSubview(genreTableView)

        configureConstraints()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func configureConstraints(){
        genreTableView.snp.makeConstraints({ make in
            make.edges.equalTo(view.safeAreaLayoutGuide)
        })
    }
}

extension GenreVC:PresenterToViewGenreProtocol{
    func onGenreResponseSuccess(genres: [Genre]) {
        source.append(contentsOf: genres)
        genreTableView.reloadData()
    }
    
    func onGenreResponseFailed(error: String) {
        let alert = UIAlertController(title: "Error", message: "Problem fetching Genres", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Okay", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}

extension GenreVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        source.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "GenreCell", for: indexPath)
        cell.textLabel?.text = source[indexPath.row].name
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        genrePresenter?.showMovieList(navigationController: self.navigationController!, genreId: source[indexPath.row].id)
    }
}
