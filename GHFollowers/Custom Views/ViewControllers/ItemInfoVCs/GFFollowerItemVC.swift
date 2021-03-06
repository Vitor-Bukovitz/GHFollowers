//
//  GFFollowerItemVC.swift
//  GHFollowers
//
//  Created by Vitor Bukovitz on 3/12/21.
//

import UIKit

class GFFollowerItemVC: GFItemInfoVC {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .followers, withCount: user.followers)
        itemInfoViewTwo.set(itemInfoType: .following, withCount: user.following)
        actionButton.set(backgroundColor: .systemGreen, title: "Get Follers")
    }
    
    override func actionButtonTapped() {
        delegate.didTapGetFollowers(for: user)
    }
}
