//
//  FollowerListVC.swift
//  GHFollowers
//
//  Created by Vitor Bukovitz on 3/4/21.
//

import UIKit

class FollowerListVC: UIViewController {
    var username: String!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.prefersLargeTitles = true
        
        NetworkManager.shared.getFollowers(for: username, page: 1) { followers, error in
            guard let followers = followers else {
                return self.presentGFAlertOnMainThread(title: "Bad Stuff Happened", message: error!, buttonTitle: "Ok")
            }
            
            print("followers.count = \(followers.count)")
            print(followers)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(false, animated: true)
    }
}
