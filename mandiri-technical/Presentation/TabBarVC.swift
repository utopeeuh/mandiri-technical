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
        let notice = MovieRouter.createMovieModule()
        
        let tabOne = UINavigationController(rootViewController: notice)
        let tabOneBarItem = UITabBarItem(title: "Home", image: UIImage(named:"Home"), selectedImage: UIImage(named: "HomeFilled"))
        tabOne.tabBarItem = tabOneBarItem
        
        
        // Stats tab
        let tabTwo = UINavigationController(rootViewController: DummyVC())
        let tabTwoBarItem = UITabBarItem(title: "Statistik", image: UIImage(named:"Stats"), selectedImage: UIImage(named: "StatsFilled"))
        
        tabTwo.tabBarItem = tabTwoBarItem
        
        self.viewControllers = [tabOne, tabTwo]
    }

}
