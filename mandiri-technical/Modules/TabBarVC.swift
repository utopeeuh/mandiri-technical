//
//  TabBarVC.swift
//  mandiri-technical
//
//  Created by Tb. Daffa Amadeo Zhafrana on 14/12/22.
//

import Foundation
import UIKit

class TabBarVC: UITabBarController, UITabBarControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Assign self for delegate for that ViewController can respond toUITabBarControllerDelegate methods
        self.delegate = self
        self.tabBar.clipsToBounds = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Home tab
        
        /* Create ui-view-controller instance*/
        let movieList = MovieRouter.createMovieModule()
        
        let tabOne = UINavigationController(rootViewController: movieList)
        let tabOneBarItem = UITabBarItem(title: "Home", image: UIImage(systemName:"house"), selectedImage: UIImage(systemName:"house.fill"))
        tabOne.tabBarItem = tabOneBarItem
        
        /* Create ui-view-controller instance*/
//        let movieList = MovieRouter.createMovieModule()
        
        // Genres tab
        let tabTwo = UINavigationController(rootViewController: DummyVC())
        let tabTwoBarItem = UITabBarItem(title: "Genres", image: UIImage(systemName: "square.stack"), selectedImage: UIImage(systemName: "square.stack.fill"))
        
        tabTwo.tabBarItem = tabTwoBarItem
        
        self.viewControllers = [tabOne, tabTwo]
    }

}
